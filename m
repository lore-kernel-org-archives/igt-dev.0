Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 10:06:43 -0000
Message-ID: <158253880302.28363.1380833715750994756@emeril.freedesktop.org>
References: <20200221111701.30006-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200221111701.30006-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Exercise_mmap-offset_mapping_to_userpt?=
 =?utf-8?q?r?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Exercise mmap-offset mapping to userptr
URL   : https://patchwork.freedesktop.org/series/73763/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7981_full -> IGTPW_4208_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4208_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@mmap-offset-invalidate@wb} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-snb4/igt@gem_userptr_blits@mmap-offset-invalidate@wb.html
    - shard-iclb:         NOTRUN -> [FAIL][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb5/igt@gem_userptr_blits@mmap-offset-invalidate@wb.html
    - shard-kbl:          NOTRUN -> [FAIL][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl2/igt@gem_userptr_blits@mmap-offset-invalidate@wb.html

  * {igt@gem_userptr_blits@mmap-offset-invalidate@wc} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl8/igt@gem_userptr_blits@mmap-offset-invalidate@wc.html
    - shard-glk:          NOTRUN -> [FAIL][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk1/igt@gem_userptr_blits@mmap-offset-invalidate@wc.html
    - shard-tglb:         NOTRUN -> [FAIL][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-tglb1/igt@gem_userptr_blits@mmap-offset-invalidate@wc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7981_full and IGTPW_4208_full:

### New IGT tests (5) ###

  * igt@gem_userptr_blits@mmap-offset-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@mmap-offset-invalidate@gtt:
    - Statuses : 6 fail(s)
    - Exec time: [0.02, 0.30] s

  * igt@gem_userptr_blits@mmap-offset-invalidate@uc:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_userptr_blits@mmap-offset-invalidate@wb:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_userptr_blits@mmap-offset-invalidate@wc:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4208_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#1277])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-tglb2/igt@gem_exec_balancer@hang.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_reuse@baggage:
    - shard-apl:          [PASS][11] -> [TIMEOUT][12] ([fdo#112271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl8/igt@gem_exec_reuse@baggage.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl2/igt@gem_exec_reuse@baggage.html

  * igt@gem_exec_schedule@fifo-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb5/igt@gem_exec_schedule@fifo-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb4/igt@gem_exec_schedule@fifo-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870] / [i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb1/igt@i915_hangman@error-state-capture-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb3/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [PASS][31] -> [TIMEOUT][32] ([fdo#112271]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-glk8/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk1/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [PASS][33] -> [TIMEOUT][34] ([fdo#112271] / [i915#561]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-tglb6/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-tglb6/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1297])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl8/igt@kms_flip@plain-flip-fb-recreate.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl8/igt@kms_flip@plain-flip-fb-recreate.html
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1297])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109276]) +20 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-snb:          [PASS][45] -> [TIMEOUT][46] ([fdo#112271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-snb4/igt@sw_sync@sync_multi_producer_single_consumer.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-snb6/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][47] ([i915#977]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-tglb8/igt@gem_busy@close-race.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-tglb7/igt@gem_busy@close-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][49] ([fdo#110854]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +19 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-both-bsd}:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd1}:
    - shard-iclb:         [SKIP][55] ([fdo#109276] / [i915#677]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +17 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-glk:          [INCOMPLETE][61] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-glk6/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk7/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-snb:          [DMESG-WARN][65] ([i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-snb5/igt@gem_set_tiling_vs_gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-snb6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_fence_blits@normal:
    - shard-apl:          [TIMEOUT][67] ([fdo#112271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl7/igt@gem_tiled_fence_blits@normal.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl4/igt@gem_tiled_fence_blits@normal.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][69] ([i915#413]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-tglb8/igt@i915_pm_rps@reset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-tglb5/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][71] ([i915#413]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl1/igt@i915_suspend@fence-restore-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][77] ([i915#72]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-apl:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][87] ([i915#899]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][91] ([i915#31]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-apl2/igt@kms_setmode@basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-apl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][93] ([fdo#112080]) -> [FAIL][94] ([IGT#28])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][95] ([IGT#28]) -> [SKIP][96] ([fdo#112080])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][97] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][98] ([fdo#111870] / [i915#478])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][99] ([i915#454]) -> [SKIP][100] ([i915#468])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [INCOMPLETE][102] ([fdo#103665])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][103] ([fdo#103665]) -> [DMESG-WARN][104] ([i915#180])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7981/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4208
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7981: d4ffe122f2582cdbf4e227fdfe84a26953c57e47 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4208: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4208/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
