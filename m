Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jan 2020 21:41:41 -0000
Message-ID: <157895170170.25475.11379439153379211601@emeril.freedesktop.org>
References: <20200110115320.1284901-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200110115320.1284901-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Find_the_associated_perf-type_for_a_particular_device_?=
 =?utf-8?b?KHJldjQp?=
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

Series: i915/perf: Find the associated perf-type for a particular device (rev4)
URL   : https://patchwork.freedesktop.org/series/71609/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5362_full -> IGTPW_3914_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3914_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3914_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3914_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pwrite@big-cpu-forwards:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb7/igt@gem_pwrite@big-cpu-forwards.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb2/igt@gem_pwrite@big-cpu-forwards.html

  
Known issues
------------

  Here are the changes found in IGTPW_3914_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-apl6/igt@gem_ctx_isolation@bcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-apl6/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#679])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-apl1/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-apl8/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111735])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111736] / [i915#472])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb2/igt@gem_exec_create@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb3/igt@gem_exec_create@basic.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +18 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#677]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([fdo#111677] / [i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-render:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([fdo#111606] / [fdo#111677] / [i915#472])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb1/igt@gem_exec_schedule@preempt-queue-render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb6/igt@gem_exec_schedule@preempt-queue-render.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_linear_blits@interruptible:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#667])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-kbl4/igt@gem_linear_blits@interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-kbl7/igt@gem_linear_blits@interruptible.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([fdo#110789] / [i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-snb6/igt@gem_partial_pwrite_pread@reads.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-snb4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#520])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-snb:          [PASS][31] -> [FAIL][32] ([i915#520])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-snb6/igt@gem_persistent_relocs@forked-thrashing.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-snb5/igt@gem_persistent_relocs@forked-thrashing.html
    - shard-iclb:         [PASS][33] -> [TIMEOUT][34] ([fdo#112271] / [i915#530])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb7/igt@gem_persistent_relocs@forked-thrashing.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb2/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#472]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb5/igt@gem_sync@basic-store-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb3/igt@gem_sync@basic-store-all.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#49])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#49]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-blt:
    - shard-tglb:         [INCOMPLETE][51] ([fdo#111735]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb3/igt@gem_ctx_shared@q-smoketest-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb2/igt@gem_ctx_shared@q-smoketest-blt.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-apl6/igt@gem_eio@in-flight-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-apl8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][55] ([i915#82]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-snb4/igt@gem_eio@kms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-snb1/igt@gem_eio@kms.html
    - shard-tglb:         [INCOMPLETE][57] ([i915#476]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb3/igt@gem_eio@kms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][59] ([fdo#108838] / [i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb6/igt@gem_exec_create@forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb2/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111677] / [i915#472]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][65] ([i915#463] / [i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb2/igt@gem_exec_schedule@smoketest-all.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb5/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#112146]) -> [PASS][68] +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [INCOMPLETE][69] ([i915#140] / [i915#530]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-iclb:         [FAIL][71] ([i915#520]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][73] ([i915#644]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [DMESG-WARN][75] ([fdo#111764]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb8/igt@gem_softpin@noreloc-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][81] ([i915#456] / [i915#460]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb6/igt@i915_pm_backlight@fade_with_suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb3/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][83] ([i915#454]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-tglb:         [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][91] ([fdo#112080]) -> [PASS][92] +8 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb1/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][93] ([fdo#109276]) -> [PASS][94] +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][95] ([IGT#28]) -> [SKIP][96] ([fdo#109276] / [fdo#112080])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][97] ([fdo#109276] / [fdo#112080]) -> [FAIL][98] ([IGT#28])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][99] ([fdo#111870]) -> [DMESG-WARN][100] ([fdo#110789] / [fdo#111870])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5362/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5362 -> IGTPW_3914

  CI-20190529: 20190529
  CI_DRM_7716: b532d43e8d71b07d1cd0619915b1d4039002b5b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/index.html
  IGT_5362: c2843f8e06a2cf7d372cd154310bf0e3b7722ab8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3914/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
