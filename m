Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Dec 2019 00:24:34 -0000
Message-ID: <157654227404.21845.3868371549050778753@emeril.freedesktop.org>
References: <20191216120923.2376-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20191216120923.2376-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWxf?=
 =?utf-8?q?gpu=5Ftop_per_client_engine_busyness_=28rev2=29?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel_gpu_top per client engine busyness (rev2)
URL   : https://patchwork.freedesktop.org/series/70980/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7574_full -> IGTPW_3867_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/index.html

Known issues
------------

  Here are the changes found in IGTPW_3867_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#456])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb5/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb8/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb5/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb8/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-persistence:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb1/igt@gem_ctx_persistence@vcs1-persistence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb3/igt@gem_ctx_persistence@vcs1-persistence.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-other-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb2/igt@gem_exec_schedule@preempt-other-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb5/igt@gem_exec_schedule@preempt-other-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-blt:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb5/igt@gem_exec_schedule@preempt-queue-blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb6/igt@gem_exec_schedule@preempt-queue-blt.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#463])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb3/igt@gem_exec_schedule@smoketest-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb4/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#520])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_selftest@live_gem_contexts:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#455])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb5/igt@i915_selftest@live_gem_contexts.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb6/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#747])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw7/igt@i915_selftest@mock_sanitycheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw4/igt@i915_selftest@mock_sanitycheck.html
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#747])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-snb4/igt@i915_selftest@mock_sanitycheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-snb1/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-apl3/igt@i915_suspend@debugfs-reader.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-apl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-iclb:         [PASS][31] -> [DMESG-WARN][32] ([IGT#6])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#456] / [i915#460] / [i915#474])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([fdo#112393] / [i915#435] / [i915#667])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][39] -> [INCOMPLETE][40] ([i915#456] / [i915#460]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103665] / [i915#648] / [i915#667]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-kbl4/igt@kms_plane@pixel-format-pipe-b-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-idle-no-semaphores-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb1/igt@perf_pmu@busy-idle-no-semaphores-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb3/igt@perf_pmu@busy-idle-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][51] ([fdo#111735]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb6/igt@gem_ctx_shared@q-smoketest-vebox.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb8/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_capture@capture-bsd2:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb6/igt@gem_exec_capture@capture-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb2/igt@gem_exec_capture@capture-bsd2.html

  * {igt@gem_exec_schedule@pi-shared-iova-bsd}:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox:
    - shard-tglb:         [INCOMPLETE][59] ([fdo#111606] / [fdo#111677]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-glk:          [TIMEOUT][61] ([i915#530]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-glk7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-glk1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-apl7/igt@gem_softpin@noreloc-s3.html
    - shard-tglb:         [INCOMPLETE][65] ([i915#456]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb2/igt@gem_softpin@noreloc-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb9/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-hsw:          [DMESG-WARN][69] ([IGT#6]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-apl:          [DMESG-WARN][71] ([IGT#6]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-hsw:          [DMESG-FAIL][73] ([i915#407] / [i915#44]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw5/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-hsw:          [DMESG-FAIL][75] ([i915#44]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw5/igt@kms_flip@plain-flip-fb-recreate.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [INCOMPLETE][81] ([i915#474] / [i915#667]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-iclb:         [INCOMPLETE][83] ([i915#123] / [i915#140]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][85] ([i915#31]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-glk9/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-glk2/igt@kms_setmode@basic.html

  * igt@perf@create-destroy-userspace-config:
    - shard-hsw:          [INCOMPLETE][87] ([i915#61]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw6/igt@perf@create-destroy-userspace-config.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw4/igt@perf@create-destroy-userspace-config.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-dirty-create:
    - shard-tglb:         [SKIP][89] ([fdo#111912] / [fdo#112080]) -> [SKIP][90] ([fdo#112080])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb2/igt@gem_ctx_isolation@vcs2-dirty-create.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-create.html

  * igt@gem_ctx_isolation@vcs2-dirty-switch:
    - shard-tglb:         [SKIP][91] ([fdo#112080]) -> [SKIP][92] ([fdo#111912] / [fdo#112080])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-switch.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb3/igt@gem_ctx_isolation@vcs2-dirty-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][93] ([i915#832]) -> [FAIL][94] ([i915#818])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][95] ([i915#818]) -> [INCOMPLETE][96] ([i915#61])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-hsw1/igt@gem_tiled_blits@normal.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][97] ([fdo#111870]) -> [DMESG-WARN][98] ([fdo#110789] / [fdo#111870])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][99] ([i915#39]) -> [FAIL][100] ([i915#413])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7574/shard-tglb5/igt@i915_pm_rps@waitboost.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/shard-tglb5/igt@i915_pm_rps@waitboost.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3867
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7574: 950244ca586c6f0efe243bf8c505c01ea5e579fa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3867: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3867/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
