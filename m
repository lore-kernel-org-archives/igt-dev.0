Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 00:26:28 -0000
Message-ID: <158328158879.429.11405918845755397465@emeril.freedesktop.org>
References: <20200303121509.29662-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200303121509.29662-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_other_now_MMAP=5FGTT_dependent?=
 =?utf-8?q?_subtests?=
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

Series: tests/gem_userptr_blits: Refresh other now MMAP_GTT dependent subtests
URL   : https://patchwork.freedesktop.org/series/74201/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8054_full -> IGTPW_4248_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4248_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@process-exit-mmap-busy@gtt} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb6/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-tglb6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8054_full and IGTPW_4248_full:

### New IGT tests (14) ###

  * igt@gem_userptr_blits@process-exit-mmap:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@uc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@gtt:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.01] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@uc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4248_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-vebox:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([fdo#103665])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl1/igt@gem_exec_schedule@pi-shared-iova-vebox.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl7/igt@gem_exec_schedule@pi-shared-iova-vebox.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#58] / [k.org#198133])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#34])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#79])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@nonexisting-fb-interruptible:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl8/igt@kms_flip@nonexisting-fb-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-apl1/igt@kms_flip@nonexisting-fb-interruptible.html
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl6/igt@kms_flip@nonexisting-fb-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl3/igt@kms_flip@nonexisting-fb-interruptible.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_sequence@get-forked-busy:
    - shard-hsw:          [PASS][37] -> [INCOMPLETE][38] ([i915#61])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-hsw6/igt@kms_sequence@get-forked-busy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-hsw7/igt@kms_sequence@get-forked-busy.html

  * igt@perf@short-reads:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#51])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl4/igt@perf@short-reads.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl2/igt@perf@short-reads.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109276]) +15 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb6/igt@prime_busy@hang-bsd2.html

  * igt@prime_vgem@sync-blt:
    - shard-tglb:         [PASS][45] -> [INCOMPLETE][46] ([i915#409])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-tglb5/igt@prime_vgem@sync-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-tglb6/igt@prime_vgem@sync-blt.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][47] ([fdo#110854]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb3/igt@gem_exec_balancer@smoke.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [i915#677]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +19 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-tglb3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][59] ([i915#644]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][63] ([i915#413]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [DMESG-WARN][69] ([i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
    - shard-hsw:          [DMESG-WARN][71] ([i915#478]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][73] ([i915#1297]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl8/igt@kms_flip@flip-vs-dpms-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-apl1/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][75] ([i915#1297]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl6/igt@kms_flip@flip-vs-dpms-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-kbl3/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][77] ([i915#899]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb4/igt@kms_psr@psr2_no_drrs.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +11 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb8/igt@perf_pmu@busy-check-all-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][83] ([fdo#109293] / [fdo#109506]) -> [SKIP][84] ([i915#1316])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][85] ([fdo#109506]) -> [SKIP][86] ([i915#1316])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [INCOMPLETE][88] ([i915#82])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-snb4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-snb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][89] ([i915#1226]) -> [SKIP][90] ([fdo#109349])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5484 -> IGTPW_4248
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8054: 00395f50bbdc5b9eb3e287e85465566d1ec094a6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/index.html
  IGT_5484: 91b36b61e76901a2bd09fe93ac7bf7b8a60f258c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4248/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
