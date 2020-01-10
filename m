Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jan 2020 20:05:59 -0000
Message-ID: <157868675936.30835.8988762209617604296@emeril.freedesktop.org>
References: <20200109222300.1154999-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200109222300.1154999-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9p?=
 =?utf-8?q?915=5Fpm=5Frc6=5Fresidency=3A_Check_we_enter_RC6_when_mostly_id?=
 =?utf-8?q?le?=
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

Series: test/i915_pm_rc6_residency: Check we enter RC6 when mostly idle
URL   : https://patchwork.freedesktop.org/series/71855/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5359_full -> IGTPW_3912_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3912_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3912_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3912_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_rc6_residency@rc6-perf} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb2/igt@i915_pm_rc6_residency@rc6-perf.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
    - shard-tglb:         [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html

  
New tests
---------

  New tests have been introduced between IGT_5359_full and IGTPW_3912_full:

### New IGT tests (1) ###

  * igt@i915_pm_rc6_residency@rc6-perf:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [4.17, 4.19] s

  

Known issues
------------

  Here are the changes found in IGTPW_3912_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276]) +13 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb4/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb7/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([fdo#111736] / [i915#472])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb7/igt@gem_exec_create@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb4/igt@gem_exec_create@basic.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([CI#80] / [i915#472]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@gem_exec_create@madvise.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb3/igt@gem_exec_create@madvise.html

  * igt@gem_exec_schedule@preempt-queue-blt:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111677] / [i915#472])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb1/igt@gem_exec_schedule@preempt-queue-blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb3/igt@gem_exec_schedule@preempt-queue-blt.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-blt:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([fdo#111606] / [fdo#111677] / [i915#472])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#707] / [i915#796])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@gem_pipe_control_store_loop@reused-buffer.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb6/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-apl4/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#472])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb5/igt@gem_sync@basic-store-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb5/igt@gem_sync@basic-store-all.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][28] -> [FAIL][29] ([i915#818])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#413])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb8/igt@i915_pm_rps@reset.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][32] -> [INCOMPLETE][33] ([fdo#103665])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#34])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-glk9/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#49])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#49])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-snb:          [PASS][40] -> [DMESG-WARN][41] ([i915#478])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][42] -> [FAIL][43] ([i915#49]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#31])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-apl6/igt@kms_setmode@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-apl1/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#112080]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [fdo#112080]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb6/igt@gem_ctx_isolation@vcs1-clean.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb2/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-FAIL][52] ([i915#436]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-snb1/igt@gem_eio@kms.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][54] ([CI#80] / [fdo#108838] / [i915#472]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@gem_exec_create@forked.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb2/igt@gem_exec_create@forked.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [INCOMPLETE][56] ([fdo#111593] / [i915#472]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb3/igt@gem_exec_gttfill@basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb7/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][58] ([fdo#112080]) -> [PASS][59] +9 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][60] ([i915#677]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd2:
    - shard-tglb:         [INCOMPLETE][64] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb5/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][66] ([i915#472]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [FAIL][70] ([i915#520]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][72] ([i915#644]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [INCOMPLETE][74] ([i915#472] / [i915#707]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb7/igt@gem_sync@basic-each.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb1/igt@gem_sync@basic-each.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][76] ([fdo#111870]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][78] ([i915#447]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-tglb:         [DMESG-WARN][80] ([i915#402]) -> [PASS][81] +13 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83] +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         [FAIL][84] ([i915#49]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         [DMESG-FAIL][86] ([i915#402]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][88] ([fdo#109642] / [fdo#111068]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][90] ([fdo#109441]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][92] ([fdo#109276]) -> [PASS][93] +20 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][94] ([fdo#111870]) -> [DMESG-WARN][95] ([fdo#110789] / [fdo#111870]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][96] ([i915#454]) -> [SKIP][97] ([i915#468])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@i915_pm_dc@dc6-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-tglb:         [DMESG-WARN][98] ([i915#402]) -> [FAIL][99] ([i915#315])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/shard-tglb4/igt@kms_color@pipe-d-ctm-0-25.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/shard-tglb5/igt@kms_color@pipe-d-ctm-0-25.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5359 -> IGTPW_3912

  CI-20190529: 20190529
  CI_DRM_7714: b633f28f2de80cdb861d6c1c3b4df6fd2d53239f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/index.html
  IGT_5359: 28451bcec2245dcc1fd0eb1d4c76335b2b4f97a5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
