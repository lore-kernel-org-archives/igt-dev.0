Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Dec 2019 18:44:43 -0000
Message-ID: <157781788307.26888.592228232946310289@emeril.freedesktop.org>
References: <20191231132158.3911-1-swati2.sharma@intel.com>
In-Reply-To: <20191231132158.3911-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHRl?=
 =?utf-8?q?sts_for_HDR_metadata_interfaces_and_bpc_switch?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add tests for HDR metadata interfaces and bpc switch
URL   : https://patchwork.freedesktop.org/series/71524/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5356_full -> IGTPW_3893_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3893_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3893_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3893_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-snb1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * {igt@kms_hdr@bpc-switch} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-hsw8/igt@kms_hdr@bpc-switch.html

  * {igt@kms_hdr@static-output} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb5/igt@kms_hdr@static-output.html

  * {igt@kms_hdr@static-swap} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-glk2/igt@kms_hdr@static-swap.html

  
New tests
---------

  New tests have been introduced between IGT_5356_full and IGTPW_3893_full:

### New IGT tests (8) ###

  * igt@kms_hdr@bpc-switch:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.10] s

  * igt@kms_hdr@bpc-switch-dpms:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.35] s

  * igt@kms_hdr@bpc-switch-suspend:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.42] s

  * igt@kms_hdr@static-output:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 2.20] s

  * igt@kms_hdr@static-swap:
    - Statuses : 1 fail(s) 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 8.11] s

  * igt@kms_hdr@static-toggle:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle-dpms:
    - Statuses : 1 fail(s) 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 4.75] s

  * igt@kms_hdr@static-toggle-suspend:
    - Statuses : 1 fail(s) 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 8.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_3893_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([fdo#111735])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb7/igt@gem_ctx_shared@q-smoketest-vebox.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb3/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-kbl7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#470])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb2/igt@gem_eio@reset-stress.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb3/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#469])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276]) +9 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([fdo#111606] / [fdo#111677]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb7/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb8/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112146]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl6/igt@gem_exec_suspend@basic-s3.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][24] -> [FAIL][25] ([i915#520])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#472])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb2/igt@gem_sync@basic-store-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb8/igt@gem_sync@basic-store-all.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][28] -> [DMESG-WARN][29] ([fdo#111870])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#454])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#109])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#31])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl7/igt@kms_setmode@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl3/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#112080]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][42] ([fdo#112080]) -> [PASS][43] +8 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb3/igt@gem_busy@busy-vcs1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][44] ([fdo#109276] / [fdo#112080]) -> [PASS][45] +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb6/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb1/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_eio@hibernate:
    - shard-iclb:         [INCOMPLETE][46] ([i915#140]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb6/igt@gem_eio@hibernate.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb3/igt@gem_eio@hibernate.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [INCOMPLETE][48] ([i915#470]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb5/igt@gem_exec_parallel@contexts.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb7/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * {igt@gem_exec_schedule@pi-distinct-iova-bsd}:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2:
    - shard-tglb:         [INCOMPLETE][54] ([fdo#111677]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-apl:          [TIMEOUT][56] ([i915#530]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [INCOMPLETE][58] ([i915#470] / [i915#472]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb8/igt@gem_sync@basic-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb7/igt@gem_sync@basic-all.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [INCOMPLETE][60] ([i915#472] / [i915#707]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb7/igt@gem_sync@basic-each.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb1/igt@gem_sync@basic-each.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][62] ([fdo#111870]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][64] ([i915#447]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [INCOMPLETE][66] ([i915#472]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb3/igt@i915_selftest@live_requests.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb5/igt@i915_selftest@live_requests.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][68] ([i915#54]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][70] ([i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][72] ([fdo#103665]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [INCOMPLETE][76] ([i915#435] / [i915#474]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [FAIL][78] ([i915#49]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [INCOMPLETE][82] ([i915#456] / [i915#460]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-position-covered-pipe-a-planes:
    - shard-apl:          [FAIL][84] ([i915#247]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-apl7/igt@kms_plane@plane-position-covered-pipe-a-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-apl4/igt@kms_plane@plane-position-covered-pipe-a-planes.html
    - shard-kbl:          [FAIL][86] ([i915#247]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-a-planes.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][88] ([fdo#109642] / [fdo#111068]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][90] ([fdo#109441]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglb:         [DMESG-WARN][92] ([i915#799]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-tglb1/igt@perf_pmu@cpu-hotplug.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-tglb1/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][94] ([fdo#109276]) -> [PASS][95] +22 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][96] ([i915#444]) -> [INCOMPLETE][97] ([i915#82])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-snb4/igt@gem_eio@kms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-snb2/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][98] ([i915#818]) -> [FAIL][99] ([i915#832])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][100] ([fdo#109349]) -> [DMESG-WARN][101] ([fdo#107724])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5356/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#469]: https://gitlab.freedesktop.org/drm/intel/issues/469
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#799]: https://gitlab.freedesktop.org/drm/intel/issues/799
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5356 -> IGTPW_3893

  CI-20190529: 20190529
  CI_DRM_7657: 265f77c05e67b37169ac1a9d750a2e2936928ea0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3893: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/index.html
  IGT_5356: 62146738c68abfa7497b023a049163932f5a9aa0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3893/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
