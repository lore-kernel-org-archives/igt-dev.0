Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 01:40:02 -0000
Message-ID: <158233560243.32577.10419654930892941994@emeril.freedesktop.org>
References: <20200219175751.15293-1-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200219175751.15293-1-akeem.g.abodunrin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgU3VwcG9y?=
 =?utf-8?q?t_to_assemble_CB_kernel_for_gen7?=
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
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Support to assemble CB kernel for gen7
URL   : https://patchwork.freedesktop.org/series/73684/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7968_full -> IGTPW_4188_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/index.html

Known issues
------------

  Here are the changes found in IGTPW_4188_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2] ([i915#694])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw1/igt@gem_caching@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-hsw2/igt@gem_caching@reads.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#1277])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb6/igt@gem_exec_balancer@hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-tglb7/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +19 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl3/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl1/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([CI#80] / [fdo#103927])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [PASS][23] -> [TIMEOUT][24] ([fdo#112271] / [i915#561])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb1/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-tglb8/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([fdo#103665])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#899])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-glk:          [PASS][35] -> [TIMEOUT][36] ([fdo#112271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk9/igt@kms_rotation_crc@primary-rotation-90.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-glk3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +14 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-glk:          [INCOMPLETE][39] ([i915#58] / [k.org#198133]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk4/igt@gem_ctx_isolation@vecs0-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-glk7/igt@gem_ctx_isolation@vecs0-s3.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-apl:          [INCOMPLETE][41] ([fdo#103927]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_reuse@baggage:
    - shard-apl:          [TIMEOUT][43] ([fdo#112271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@gem_exec_reuse@baggage.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl3/igt@gem_exec_reuse@baggage.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [i915#677]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-hsw:          [FAIL][51] ([i915#694]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw8/igt@gem_partial_pwrite_pread@reads-uncached.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-hsw7/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [FAIL][53] ([i915#370]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb7/igt@i915_pm_rps@min-max-config-loaded.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][55] ([i915#413]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb3/igt@i915_pm_rps@waitboost.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-tglb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl7/igt@kms_flip@flip-vs-dpms-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl2/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl7/igt@kms_flip@flip-vs-dpms-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-kbl7/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-tglb:         [TIMEOUT][63] ([fdo#112271] / [i915#561]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb7/igt@kms_flip@flip-vs-panning-vs-hang.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-tglb1/igt@kms_flip@flip-vs-panning-vs-hang.html
    - shard-glk:          [TIMEOUT][65] ([fdo#112271]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk1/igt@kms_flip@flip-vs-panning-vs-hang.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-glk8/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-apl:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl8/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
    - shard-kbl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][73] ([i915#899]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +11 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][83] ([i915#1176] / [i915#61]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw5/igt@perf_pmu@cpu-hotplug.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-hsw8/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][85] ([fdo#109276]) -> [PASS][86] +15 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb1/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][87] ([i915#831]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][89] ([IGT#28]) -> [SKIP][90] ([fdo#112080])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][91] ([i915#818]) -> [FAIL][92] ([i915#694]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw8/igt@gem_tiled_blits@normal.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][93] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][94] ([fdo#111870] / [i915#478])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [DMESG-FAIL][95] ([i915#1233]) -> [INCOMPLETE][96] ([i915#1233])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb7/igt@i915_selftest@live_gt_lrc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-tglb8/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][97] ([fdo#112271]) -> [TIMEOUT][98] ([fdo#112271] / [i915#727])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl7/igt@kms_content_protection@srm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/shard-kbl1/igt@kms_content_protection@srm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5452 -> IGTPW_4188
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7968: fbfd614e946dc8ba097ea684179eee70fb6e53ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4188: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/index.html
  IGT_5452: c05dc6cd816feb1cc518ce777ab3fd6c81893113 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
