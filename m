Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 14 Dec 2019 07:53:41 -0000
Message-ID: <157631002192.13804.2168405082333153398@emeril.freedesktop.org>
References: <20191212181556.30059-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212181556.30059-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_i915_pipe_stress_test_=28rev3=29?=
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
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce i915 pipe stress test (rev3)
URL   : https://patchwork.freedesktop.org/series/70815/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7551_full -> IGTPW_3859_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3859_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3859_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3859_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pipe_stress@stress-xrgb8888-untiled} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-snb7/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-hsw8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-glk7/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7551_full and IGTPW_3859_full:

### New IGT tests (1) ###

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - Statuses : 5 fail(s) 1 pass(s)
    - Exec time: [0.0, 30.24] s

  

Known issues
------------

  Here are the changes found in IGTPW_3859_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([i915#435]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@gem_busy@close-race.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb6/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@vcs1-hostile:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276] / [fdo#112080])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb1/igt@gem_ctx_persistence@vcs1-hostile.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb3/igt@gem_ctx_persistence@vcs1-hostile.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111735])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb5/igt@gem_ctx_shared@q-smoketest-vebox.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb9/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][14] -> [INCOMPLETE][15] ([fdo#103665])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_parallel@vcs0:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([fdo#111593])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb7/igt@gem_exec_parallel@vcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb1/igt@gem_exec_parallel@vcs0.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109276]) +6 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112146]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#644])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([fdo#111870]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb7/igt@gem_userptr_blits@dmabuf-sync.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [PASS][28] -> [DMESG-WARN][29] ([fdo#110789] / [fdo#111870])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][30] -> [INCOMPLETE][31] ([i915#455])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb2/igt@i915_selftest@live_gt_timelines.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb6/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#456] / [i915#460]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#54]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#54]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-iclb:         [PASS][38] -> [DMESG-WARN][39] ([fdo#111764])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][40] -> [INCOMPLETE][41] ([i915#61])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-hsw6/igt@kms_flip@flip-vs-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-hsw5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][42] -> [FAIL][43] ([i915#49]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#49])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#49])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-kbl:          [PASS][48] -> [INCOMPLETE][49] ([fdo#103665] / [i915#435] / [i915#648] / [i915#667])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl2/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109441])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#31])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-glk2/igt@kms_setmode@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-glk7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][56] -> [INCOMPLETE][57] ([i915#460])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#112080]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][60] ([fdo#109276] / [fdo#112080]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb1/igt@gem_exec_schedule@preempt-other-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb3/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +18 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2:
    - shard-tglb:         [INCOMPLETE][66] ([fdo#111677]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-render:
    - shard-tglb:         [INCOMPLETE][68] ([fdo#111606] / [fdo#111677]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-render.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-render.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][70] ([i915#530]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-iclb:         [FAIL][72] ([i915#644]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][74] ([i915#456]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb4/igt@gem_softpin@noreloc-s3.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb9/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][76] ([i915#817]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-hsw7/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][78] ([fdo#111870]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-tglb:         [DMESG-WARN][80] ([i915#766]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@i915_pm_rpm@drm-resources-equal.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb8/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][82] ([i915#71]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@kms_color@pipe-a-gamma.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb1/igt@kms_color@pipe-a-gamma.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][84] ([i915#435] / [i915#456] / [i915#460]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +8 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [INCOMPLETE][88] ([i915#474] / [i915#667]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [INCOMPLETE][90] ([i915#435] / [i915#667]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-tglb:         [INCOMPLETE][92] ([fdo#112393] / [i915#667]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [DMESG-WARN][94] ([i915#180]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][96] ([fdo#103665] / [i915#648] / [i915#667]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl6/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-kbl7/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][98] ([fdo#112080]) -> [PASS][99] +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb6/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb1/igt@perf_pmu@busy-accuracy-98-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][100] ([IGT#28]) -> [SKIP][101] ([fdo#109276] / [fdo#112080])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-clean:
    - shard-tglb:         [SKIP][102] ([fdo#111912] / [fdo#112080]) -> [SKIP][103] ([fdo#112080]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb5/igt@gem_ctx_isolation@vcs2-clean.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-tglb9/igt@gem_ctx_isolation@vcs2-clean.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][104] ([fdo#107724]) -> [SKIP][105] ([fdo#109349])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#766]: https://gitlab.freedesktop.org/drm/intel/issues/766
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3859
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7551: e60aa4ffc106f910452d28f2ea49ae2ff44d85d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3859: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3859/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
