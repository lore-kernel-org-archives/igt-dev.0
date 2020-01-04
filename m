Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 04 Jan 2020 20:46:07 -0000
Message-ID: <157817076750.3249.6650632692348778846@emeril.freedesktop.org>
References: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Find_the_associated_perf-type_for_a_particular_device_?=
 =?utf-8?b?KHJldjIp?=
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

Series: i915/perf: Find the associated perf-type for a particular device (rev2)
URL   : https://patchwork.freedesktop.org/series/71609/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7677_full -> IGTPW_3899_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3899_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3899_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3899_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@bonded-cork:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb1/igt@gem_exec_balancer@bonded-cork.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb3/igt@gem_exec_balancer@bonded-cork.html

  * igt@gem_exec_balancer@full-late-pulse:
    - shard-glk:          [PASS][3] -> [FAIL][4] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk7/igt@gem_exec_balancer@full-late-pulse.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk7/igt@gem_exec_balancer@full-late-pulse.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-kbl:          [PASS][5] -> [FAIL][6] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl4/igt@gem_exec_balancer@full-pulse.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl4/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_balancer@individual:
    - shard-apl:          [PASS][7] -> [FAIL][8] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl6/igt@gem_exec_balancer@individual.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl1/igt@gem_exec_balancer@individual.html
    - shard-iclb:         [PASS][9] -> [FAIL][10] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb7/igt@gem_exec_balancer@individual.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb5/igt@gem_exec_balancer@individual.html

  * igt@gem_exec_balancer@semaphore:
    - shard-tglb:         NOTRUN -> [FAIL][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb2/igt@gem_exec_balancer@semaphore.html

  * igt@perf_pmu@busy-accuracy-2-bcs0:
    - shard-iclb:         [PASS][12] -> [TIMEOUT][13] +49 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb5/igt@perf_pmu@busy-accuracy-2-bcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb3/igt@perf_pmu@busy-accuracy-2-bcs0.html

  * igt@perf_pmu@busy-start-vecs0:
    - shard-iclb:         [PASS][14] -> [SKIP][15] +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb4/igt@perf_pmu@busy-start-vecs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb7/igt@perf_pmu@busy-start-vecs0.html

  * igt@perf_pmu@idle-no-semaphores-bcs0:
    - shard-snb:          NOTRUN -> [TIMEOUT][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb2/igt@perf_pmu@idle-no-semaphores-bcs0.html

  * igt@perf_pmu@init-wait-vcs0:
    - shard-glk:          [PASS][17] -> [TIMEOUT][18] +36 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk6/igt@perf_pmu@init-wait-vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk1/igt@perf_pmu@init-wait-vcs0.html

  * igt@perf_pmu@interrupts:
    - shard-iclb:         NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb6/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [PASS][20] -> [TIMEOUT][21] +7 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-hsw2/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  * igt@perf_pmu@multi-client-bcs0:
    - shard-snb:          [PASS][22] -> [TIMEOUT][23] +31 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb2/igt@perf_pmu@multi-client-bcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb6/igt@perf_pmu@multi-client-bcs0.html

  * igt@perf_pmu@other-init-2:
    - shard-hsw:          NOTRUN -> [TIMEOUT][24] +9 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-hsw7/igt@perf_pmu@other-init-2.html

  * igt@perf_pmu@rc6:
    - shard-apl:          [PASS][25] -> [TIMEOUT][26] +41 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl8/igt@perf_pmu@rc6.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl4/igt@perf_pmu@rc6.html

  * igt@perf_pmu@render-node-busy-vcs1:
    - shard-kbl:          [PASS][27] -> [TIMEOUT][28] +56 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl2/igt@perf_pmu@render-node-busy-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl2/igt@perf_pmu@render-node-busy-vcs1.html

  * igt@perf_pmu@semaphore-wait-idle-vcs2:
    - shard-iclb:         NOTRUN -> [TIMEOUT][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb6/igt@perf_pmu@semaphore-wait-idle-vcs2.html

  * igt@perf_pmu@semaphore-wait-idle-vecs0:
    - shard-tglb:         [PASS][30] -> [SKIP][31] +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb6/igt@perf_pmu@semaphore-wait-idle-vecs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb1/igt@perf_pmu@semaphore-wait-idle-vecs0.html

  
#### Warnings ####

  * igt@perf_pmu@busy-accuracy-2-rcs0:
    - shard-snb:          [SKIP][32] ([fdo#109271]) -> [TIMEOUT][33] +15 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb2/igt@perf_pmu@busy-accuracy-2-rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb4/igt@perf_pmu@busy-accuracy-2-rcs0.html

  * igt@perf_pmu@busy-accuracy-98-rcs0:
    - shard-hsw:          [SKIP][34] ([fdo#109271]) -> [TIMEOUT][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-hsw1/igt@perf_pmu@busy-accuracy-98-rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-hsw7/igt@perf_pmu@busy-accuracy-98-rcs0.html

  * igt@perf_pmu@busy-no-semaphores-vcs2:
    - shard-iclb:         [SKIP][36] ([fdo#112080]) -> [TIMEOUT][37] +11 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs2.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs2.html

  * igt@perf_pmu@busy-vcs1:
    - shard-glk:          [SKIP][38] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][39] +16 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk7/igt@perf_pmu@busy-vcs1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk2/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@init-sema-vcs2:
    - shard-apl:          [SKIP][40] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][41] +18 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl2/igt@perf_pmu@init-sema-vcs2.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl2/igt@perf_pmu@init-sema-vcs2.html

  * igt@perf_pmu@render-node-busy-vcs2:
    - shard-hsw:          [SKIP][42] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][43] +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-hsw5/igt@perf_pmu@render-node-busy-vcs2.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-hsw7/igt@perf_pmu@render-node-busy-vcs2.html

  * igt@perf_pmu@semaphore-wait-idle-vcs2:
    - shard-kbl:          [SKIP][44] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][45] +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl4/igt@perf_pmu@semaphore-wait-idle-vcs2.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl2/igt@perf_pmu@semaphore-wait-idle-vcs2.html
    - shard-snb:          [SKIP][46] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][47] +19 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb7/igt@perf_pmu@semaphore-wait-idle-vcs2.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb4/igt@perf_pmu@semaphore-wait-idle-vcs2.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@bonded-semaphore}:
    - shard-apl:          [PASS][48] -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl6/igt@gem_exec_balancer@bonded-semaphore.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl6/igt@gem_exec_balancer@bonded-semaphore.html

  
Known issues
------------

  Here are the changes found in IGTPW_3899_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb3/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][52] -> [INCOMPLETE][53] ([fdo#111735])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb8/igt@gem_ctx_shared@q-smoketest-vebox.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb3/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109276]) +9 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb8/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#112146]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1:
    - shard-tglb:         [PASS][58] -> [INCOMPLETE][59] ([fdo#111677])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb5/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [PASS][60] -> [DMESG-WARN][61] ([fdo#111870])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#112080]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb1/igt@gem_wait@await-vcs1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb3/igt@gem_wait@await-vcs1.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-tglb:         [PASS][66] -> [FAIL][67] ([i915#49]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-kbl:          [PASS][70] -> [TIMEOUT][71] ([fdo#112271]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl3/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl6/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@perf_pmu@busy-accuracy-50-vcs0:
    - shard-iclb:         [PASS][72] -> [TIMEOUT][73] ([fdo#112271]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb6/igt@perf_pmu@busy-accuracy-50-vcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb1/igt@perf_pmu@busy-accuracy-50-vcs0.html
    - shard-glk:          [PASS][74] -> [TIMEOUT][75] ([fdo#112271])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk4/igt@perf_pmu@busy-accuracy-50-vcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk2/igt@perf_pmu@busy-accuracy-50-vcs0.html
    - shard-apl:          [PASS][76] -> [TIMEOUT][77] ([fdo#112271]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl4/igt@perf_pmu@busy-accuracy-50-vcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl8/igt@perf_pmu@busy-accuracy-50-vcs0.html
    - shard-tglb:         [PASS][78] -> [TIMEOUT][79] ([fdo#112271] / [i915#923]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb2/igt@perf_pmu@busy-accuracy-50-vcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb1/igt@perf_pmu@busy-accuracy-50-vcs0.html

  * igt@perf_pmu@busy-hang-vecs0:
    - shard-apl:          [PASS][80] -> [SKIP][81] ([fdo#109271]) +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl4/igt@perf_pmu@busy-hang-vecs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl4/igt@perf_pmu@busy-hang-vecs0.html

  * igt@perf_pmu@busy-idle-check-all-vcs0:
    - shard-glk:          [PASS][82] -> [SKIP][83] ([fdo#109271]) +6 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk2/igt@perf_pmu@busy-idle-check-all-vcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk8/igt@perf_pmu@busy-idle-check-all-vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-apl:          [PASS][84] -> [TIMEOUT][85] ([fdo#111546])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl1/igt@perf_pmu@cpu-hotplug.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl1/igt@perf_pmu@cpu-hotplug.html
    - shard-kbl:          [PASS][86] -> [TIMEOUT][87] ([fdo#111546])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl1/igt@perf_pmu@cpu-hotplug.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl7/igt@perf_pmu@cpu-hotplug.html
    - shard-snb:          [PASS][88] -> [TIMEOUT][89] ([fdo#111546])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb7/igt@perf_pmu@cpu-hotplug.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb5/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-kbl:          [PASS][90] -> [SKIP][91] ([fdo#109271] / [fdo#112080])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl7/igt@perf_pmu@init-busy-vcs1.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl2/igt@perf_pmu@init-busy-vcs1.html

  * igt@perf_pmu@interrupts:
    - shard-snb:          [PASS][92] -> [SKIP][93] ([fdo#109271])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb7/igt@perf_pmu@interrupts.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb4/igt@perf_pmu@interrupts.html
    - shard-kbl:          [PASS][94] -> [SKIP][95] ([fdo#109271]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl4/igt@perf_pmu@interrupts.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl2/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@multi-client-vecs0:
    - shard-hsw:          [PASS][96] -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-hsw5/igt@perf_pmu@multi-client-vecs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-hsw5/igt@perf_pmu@multi-client-vecs0.html

  * igt@perf_pmu@other-init-0:
    - shard-tglb:         [PASS][98] -> [TIMEOUT][99] ([i915#923]) +29 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb6/igt@perf_pmu@other-init-0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb6/igt@perf_pmu@other-init-0.html

  * igt@perf_pmu@render-node-busy-bcs0:
    - shard-apl:          [PASS][100] -> [INCOMPLETE][101] ([fdo#103927])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl6/igt@perf_pmu@render-node-busy-bcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl6/igt@perf_pmu@render-node-busy-bcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-iclb:         [SKIP][102] ([fdo#109276] / [fdo#112080]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb5/igt@gem_ctx_isolation@vcs1-s3.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb4/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][104] ([fdo#112146]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_parallel@vcs1:
    - shard-iclb:         [SKIP][106] ([fdo#112080]) -> [PASS][107] +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb7/igt@gem_exec_parallel@vcs1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb1/igt@gem_exec_parallel@vcs1.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109] +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [DMESG-WARN][110] ([i915#118] / [i915#95]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk9/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][112] ([i915#180]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl1/igt@i915_suspend@forcewake.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl1/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][114] ([i915#54]) -> [PASS][115] +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-kbl:          [FAIL][116] ([i915#54]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-glk:          [FAIL][118] ([i915#54]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][120] ([fdo#109441]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb4/igt@kms_psr@psr2_basic.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][122] ([fdo#109276]) -> [PASS][123] +9 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-tglb:         [INCOMPLETE][124] ([i915#470] / [i915#475]) -> [INCOMPLETE][125] ([i915#470])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb1/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb9/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][126] ([fdo#111870]) -> [DMESG-WARN][127] ([fdo#110789] / [fdo#111870]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][128] ([fdo#112016] / [fdo#112021]) -> [SKIP][129] ([fdo#112021])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb6/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [FAIL][130] ([i915#54]) -> [DMESG-WARN][131] ([i915#180])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][132] ([fdo#107724]) -> [SKIP][133] ([fdo#109349])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-glk:          [SKIP][134] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][135] ([fdo#112271])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk4/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk9/igt@perf_pmu@busy-accuracy-2-vcs1.html
    - shard-iclb:         [SKIP][136] ([fdo#112080]) -> [TIMEOUT][137] ([fdo#112271])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html
    - shard-apl:          [SKIP][138] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][139] ([fdo#112271])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl4/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl6/igt@perf_pmu@busy-accuracy-2-vcs1.html
    - shard-hsw:          [SKIP][140] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][141] ([fdo#112271])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-hsw7/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-hsw2/igt@perf_pmu@busy-accuracy-2-vcs1.html
    - shard-snb:          [SKIP][142] ([fdo#109271] / [fdo#112080]) -> [TIMEOUT][143] ([fdo#112271])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb4/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@perf_pmu@busy-accuracy-50-vcs0:
    - shard-snb:          [SKIP][144] ([fdo#109271]) -> [TIMEOUT][145] ([fdo#112271]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb2/igt@perf_pmu@busy-accuracy-50-vcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb7/igt@perf_pmu@busy-accuracy-50-vcs0.html

  * igt@perf_pmu@busy-accuracy-50-vcs2:
    - shard-tglb:         [SKIP][146] ([fdo#112080]) -> [TIMEOUT][147] ([i915#923]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb2/igt@perf_pmu@busy-accuracy-50-vcs2.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb6/igt@perf_pmu@busy-accuracy-50-vcs2.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-apl:          [SKIP][148] ([fdo#109271] / [fdo#112080]) -> [INCOMPLETE][149] ([fdo#103927]) +3 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-apl1/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-apl3/igt@perf_pmu@busy-accuracy-98-vcs1.html

  * igt@perf_pmu@busy-idle-check-all-vcs1:
    - shard-iclb:         [SKIP][150] ([fdo#112080]) -> [SKIP][151] ([fdo#109276] / [fdo#112080])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb7/igt@perf_pmu@busy-idle-check-all-vcs1.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb2/igt@perf_pmu@busy-idle-check-all-vcs1.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][152] ([fdo#112080]) -> [INCOMPLETE][153] ([i915#140]) +4 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html

  * igt@perf_pmu@init-busy-vcs2:
    - shard-glk:          [SKIP][154] ([fdo#109271] / [fdo#112080]) -> [INCOMPLETE][155] ([i915#58] / [k.org#198133])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-glk3/igt@perf_pmu@init-busy-vcs2.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-glk1/igt@perf_pmu@init-busy-vcs2.html
    - shard-snb:          [SKIP][156] ([fdo#109271] / [fdo#112080]) -> [INCOMPLETE][157] ([i915#82]) +4 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb6/igt@perf_pmu@init-busy-vcs2.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb7/igt@perf_pmu@init-busy-vcs2.html

  * igt@perf_pmu@most-busy-check-all-vcs2:
    - shard-kbl:          [SKIP][158] ([fdo#109271] / [fdo#112080]) -> [INCOMPLETE][159] ([fdo#103665]) +2 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-kbl6/igt@perf_pmu@most-busy-check-all-vcs2.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-kbl3/igt@perf_pmu@most-busy-check-all-vcs2.html

  * igt@perf_pmu@multi-client-vcs2:
    - shard-tglb:         [SKIP][160] ([fdo#112080]) -> [INCOMPLETE][161] ([i915#923])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-tglb1/igt@perf_pmu@multi-client-vcs2.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-tglb9/igt@perf_pmu@multi-client-vcs2.html

  * igt@perf_pmu@semaphore-wait-idle-vecs0:
    - shard-snb:          [SKIP][162] ([fdo#109271]) -> [INCOMPLETE][163] ([i915#82]) +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7677/shard-snb6/igt@perf_pmu@semaphore-wait-idle-vecs0.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/shard-snb5/igt@perf_pmu@semaphore-wait-idle-vecs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3899/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
