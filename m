Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 15:23:48 -0000
Message-ID: <157953382888.680.11821588806104938963@emeril.freedesktop.org>
References: <20200117171545.3212625-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200117171545.3212625-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_lib/intel=5Fbufops=3A_Introduc?=
 =?utf-8?q?e_buffer_operations?=
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

Series: series starting with [i-g-t,1/5] lib/intel_bufops: Introduce buffer operations
URL   : https://patchwork.freedesktop.org/series/72210/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7764_full -> IGTPW_3935_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/index.html

Known issues
------------

  Here are the changes found in IGTPW_3935_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +12 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103665] / [i915#530])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-kbl4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-kbl6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([fdo#112271] / [i915#530])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-glk:          [PASS][11] -> [TIMEOUT][12] ([fdo#112271] / [i915#530])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk4/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk5/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-apl8/igt@gem_workarounds@suspend-resume-context.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][17] -> [DMESG-FAIL][18] ([i915#725])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-hsw7/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([fdo#111764]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb2/igt@i915_suspend@fence-restore-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb8/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([i915#42])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-snb4/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-snb4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#84])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk3/igt@perf@oa-exponents.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk8/igt@perf@oa-exponents.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109276]) +21 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [FAIL][41] ([i915#570]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-apl2/igt@gem_ctx_persistence@processes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-apl3/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +16 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-iclb:         [FAIL][51] ([i915#520]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [TIMEOUT][53] ([fdo#112271] / [i915#530]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [TIMEOUT][55] ([fdo#112271] / [i915#530]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-hsw5/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870] / [i915#478]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][59] ([i915#716]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk1/igt@kms_flip@flip-vs-expired-vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-iclb:         [INCOMPLETE][67] ([i915#140]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb4/igt@kms_psr@psr2_suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][73] ([i915#31]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-apl6/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][75] ([fdo#112080]) -> [PASS][76] +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb8/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb2/igt@perf_pmu@busy-accuracy-98-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][77] ([fdo#109276] / [fdo#112080]) -> [FAIL][78] ([IGT#28])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][79] ([i915#443] / [i915#444]) -> [INCOMPLETE][80] ([i915#82])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-snb6/igt@gem_eio@kms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-snb5/igt@gem_eio@kms.html

  * igt@runner@aborted:
    - shard-glk:          ([FAIL][81], [FAIL][82], [FAIL][83]) ([k.org#202321]) -> [FAIL][84] ([i915#997] / [k.org#202321])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk4/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk2/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/shard-glk4/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/shard-glk9/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#443]: https://gitlab.freedesktop.org/drm/intel/issues/443
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3935
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7764: 390553573eeaaf2d76f53d5fa3dc1aff9acd9140 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3935: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
