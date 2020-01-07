Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Jan 2020 15:37:34 -0000
Message-ID: <157841145432.8939.12767441935490361711@emeril.freedesktop.org>
References: <20200107082548.3693-1-ramalingam.c@intel.com>
In-Reply-To: <20200107082548.3693-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/intel=5Fmemory=5Fregion=3A_wrappers_for_memory_regions_ops?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/intel_memory_region: wrappers for memory regions ops
URL   : https://patchwork.freedesktop.org/series/71687/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7690_full -> IGTPW_3901_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/index.html

Known issues
------------

  Here are the changes found in IGTPW_3901_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb5/igt@gem_exec_schedule@preempt-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111677] / [i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb9/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10] ([i915#58] / [k.org#198133])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-glk7/igt@gem_softpin@noreloc-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-glk4/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [PASS][11] -> [INCOMPLETE][12] ([i915#61])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-hsw5/igt@gem_softpin@noreloc-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-hsw2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#435] / [i915#472])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb2/igt@gem_sync@basic-store-each.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb7/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb3/igt@i915_pm_rps@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#455])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb2/igt@i915_selftest@live_gt_timelines.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb4/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#49]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb7/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@perf_pmu@enable-race-vecs0:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#470] / [i915#472])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb3/igt@perf_pmu@enable-race-vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb1/igt@perf_pmu@enable-race-vecs0.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][37] ([fdo#112080]) -> [PASS][38] +14 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [fdo#112080]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb7/igt@gem_ctx_isolation@vcs1-none.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#110841]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-10ms:
    - shard-tglb:         [INCOMPLETE][43] ([i915#435] / [i915#534]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb1/igt@gem_eio@in-flight-10ms.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb1/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [INCOMPLETE][45] ([i915#61]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-hsw2/igt@gem_eio@in-flight-contexts-1us.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-hsw2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][47] ([fdo#110854]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +13 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_wait@basic-wait-write-all:
    - shard-tglb:         [INCOMPLETE][55] ([i915#472]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb8/igt@gem_wait@basic-wait-write-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb7/igt@gem_wait@basic-wait-write-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][57] ([i915#716]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][59] ([i915#454]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [FAIL][63] ([i915#54]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-glk:          [FAIL][65] ([i915#54]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][69] ([fdo#103665]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][73] ([i915#31]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-apl2/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-apl1/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-kbl4/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-kbl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][79] ([i915#831]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][81] ([fdo#109276] / [fdo#112080]) -> [FAIL][82] ([IGT#28])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][83] ([fdo#108838] / [i915#435]) -> [INCOMPLETE][84] ([fdo#108838] / [i915#435] / [i915#472])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb6/igt@gem_exec_create@forked.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb6/igt@gem_exec_create@forked.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][85] ([i915#818]) -> [FAIL][86] ([i915#694])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@kms_atomic_transition@6x-modeset-transitions:
    - shard-tglb:         [SKIP][87] ([fdo#112021]) -> [SKIP][88] ([fdo#112016] / [fdo#112021])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb2/igt@kms_atomic_transition@6x-modeset-transitions.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [INCOMPLETE][89] ([i915#756] / [i915#923]) -> [INCOMPLETE][90] ([i915#472] / [i915#756]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7690/shard-tglb3/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/shard-tglb2/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#756]: https://gitlab.freedesktop.org/drm/intel/issues/756
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#923]: https://gitlab.freedesktop.org/drm/intel/issues/923
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3901
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7690: fc0ff49196d0144e8b72406a8ca71a395dbd7040 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3901: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3901/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
