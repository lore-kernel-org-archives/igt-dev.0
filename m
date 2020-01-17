Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jan 2020 17:17:22 -0000
Message-ID: <157928144278.26755.120060950546267851@emeril.freedesktop.org>
References: <20200115091307.2602311-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200115091307.2602311-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Drop_extended_basic_mmap_testing_from_BAT?=
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

Series: intel-ci: Drop extended basic mmap testing from BAT
URL   : https://patchwork.freedesktop.org/series/72049/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7748_full -> IGTPW_3924_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/index.html

Known issues
------------

  Here are the changes found in IGTPW_3924_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@kms:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#82])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-snb2/igt@gem_eio@kms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@full-late-pulse:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#472]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb7/igt@gem_exec_balancer@full-late-pulse.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb3/igt@gem_exec_balancer@full-late-pulse.html

  * igt@gem_exec_parallel@fds:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#470] / [i915#472])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb5/igt@gem_exec_parallel@fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb3/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-snb2/igt@gem_exec_reloc@basic-gtt-cpu.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-snb2/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109276]) +21 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb5/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#472] / [i915#707])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb6/igt@gem_exec_schedule@smoketest-vebox.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb4/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([fdo#111736] / [i915#460] / [i915#472])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb8/igt@gem_exec_suspend@basic-s3.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-kbl:          [PASS][25] -> [INCOMPLETE][26] ([fdo#103665] / [i915#530])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl2/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl4/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][27] -> [TIMEOUT][28] ([fdo#112271] / [i915#530]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#455] / [i915#472])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb5/igt@i915_selftest@live_gt_timelines.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb6/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#472] / [i915#519])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb3/igt@kms_cursor_legacy@pipe-d-forked-move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb2/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#79])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-apl7/igt@kms_flip@flip-vs-expired-vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-apl7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([fdo#111764])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb1/igt@kms_flip@flip-vs-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#49]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@prime_vgem@sync-bsd:
    - shard-tglb:         [PASS][45] -> [INCOMPLETE][46] ([i915#409] / [i915#472])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb1/igt@prime_vgem@sync-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb3/igt@prime_vgem@sync-bsd.html

  
#### Possible fixes ####

  * igt@gem_cs_tlb@vcs1:
    - shard-tglb:         [INCOMPLETE][47] ([i915#472]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb1/igt@gem_cs_tlb@vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb4/igt@gem_cs_tlb@vcs1.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-apl:          [FAIL][49] ([i915#679]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-apl4/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-apl4/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [fdo#112080]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][53] ([i915#490]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-snb6/igt@gem_eio@in-flight-contexts-1us.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-snb4/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-external:
    - shard-tglb:         [INCOMPLETE][55] ([i915#472] / [i915#534]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb6/igt@gem_eio@in-flight-external.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb7/igt@gem_eio@in-flight-external.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-render:
    - shard-tglb:         [INCOMPLETE][59] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-render.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb4/igt@gem_exec_schedule@preempt-queue-contexts-render.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +7 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][63] ([i915#456] / [i915#472]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [TIMEOUT][65] ([fdo#112271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [TIMEOUT][67] ([fdo#112271] / [i915#530]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][69] ([fdo#103665] / [i915#530]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl3/igt@gem_persistent_relocs@forked-thrashing.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [INCOMPLETE][71] ([i915#472] / [i915#707] / [i915#796]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb6/igt@gem_pipe_control_store_loop@reused-buffer.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb8/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][73] ([i915#644]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][75] ([i915#644]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870] / [i915#478]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][79] ([i915#413]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb4/igt@i915_pm_rps@reset.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-apl:          [DMESG-WARN][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-apl1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][83] ([i915#58] / [k.org#198133]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         [SKIP][87] ([i915#668]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][89] ([fdo#109642] / [fdo#111068]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb1/igt@kms_psr@psr2_basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][93] ([i915#31]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl4/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][97] ([fdo#103665]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +12 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][101] ([fdo#109276]) -> [PASS][102] +19 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][103] ([fdo#109276] / [fdo#112080]) -> [FAIL][104] ([IGT#28])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][105] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7748/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#519]: https://gitlab.freedesktop.org/drm/intel/issues/519
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5365 -> IGTPW_3924
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7748: 1793de9a4215356790b87608fcfc9e99eeb6954d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3924: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/index.html
  IGT_5365: e9ec0ed63b25c86861ffac3c8601cc4d1b910b65 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3924/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
