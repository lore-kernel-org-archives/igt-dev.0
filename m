Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Feb 2020 12:49:53 -0000
Message-ID: <158064779321.17035.4554684961903020111@emeril.freedesktop.org>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Convert_engine_subtests_to_dyna?=
 =?utf-8?q?mic_=28rev3=29?=
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

Series: tests/i915/gem_ctx_persistence: Convert engine subtests to dynamic (rev3)
URL   : https://patchwork.freedesktop.org/series/72793/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7845_full -> IGTPW_4047_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7845_full and IGTPW_4047_full:

### New IGT tests (65) ###

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@engines-hang@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@gem_ctx_persistence@engines-hang@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@engines-hostile-preempt@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.70] s

  * igt@gem_ctx_persistence@engines-hostile-preempt@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.67, 0.72] s

  * igt@gem_ctx_persistence@engines-hostile-preempt@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.70] s

  * igt@gem_ctx_persistence@engines-hostile-preempt@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.70] s

  * igt@gem_ctx_persistence@engines-hostile-preempt@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.70, 0.71] s

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.24, 0.28] s

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.27] s

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.27] s

  * igt@gem_ctx_persistence@engines-mixed-process@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.27, 0.29] s

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.24, 0.29] s

  * igt@gem_ctx_persistence@engines-mixed@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_ctx_persistence@engines-mixed@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_ctx_persistence@engines-mixed@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02] s

  * igt@gem_ctx_persistence@engines-mixed@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02] s

  * igt@gem_ctx_persistence@engines-mixed@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ctx_persistence@engines-persistence@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.02, 1.03] s

  * igt@gem_ctx_persistence@engines-persistence@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.07] s

  * igt@gem_ctx_persistence@engines-persistence@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.02] s

  * igt@gem_ctx_persistence@engines-persistence@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.02, 1.03] s

  * igt@gem_ctx_persistence@engines-persistence@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.02] s

  * igt@gem_ctx_persistence@engines-queued@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@gem_ctx_persistence@engines-queued@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@gem_ctx_persistence@engines-queued@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@gem_ctx_persistence@engines-queued@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ctx_persistence@engines-queued@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@bsd:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@bsd1:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@default:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-cleanup@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.70, 0.71] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@bsd:
    - Statuses : 5 pass(s)
    - Exec time: [0.70, 0.71] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@bsd1:
    - Statuses : 5 pass(s)
    - Exec time: [0.70, 0.71] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@bsd2:
    - Statuses : 3 pass(s)
    - Exec time: [0.70] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@default:
    - Statuses : 5 pass(s)
    - Exec time: [0.69, 0.72] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.70, 0.71] s

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.70, 0.71] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd1:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@default:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.27] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - Statuses : 5 pass(s)
    - Exec time: [0.24, 0.27] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.27] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2:
    - Statuses : 3 pass(s)
    - Exec time: [0.26] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@default:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.28] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.23, 0.29] s

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.29] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@bsd:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@bsd1:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@default:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.02] s

  * igt@gem_ctx_persistence@legacy-engines-mixed@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_4047_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([fdo#112271] / [i915#1084])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-hsw1/igt@gem_exec_parallel@rcs0-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-hsw5/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +14 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#49])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109642] / [fdo#111068])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl6/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl7/igt@kms_setmode@basic.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#831])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][31] ([fdo#110841]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [TIMEOUT][33] ([fdo#112271]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-tglb6/igt@gem_exec_balancer@hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +13 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38] +14 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-hsw5/igt@gem_tiled_partial_pwrite_pread@reads.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][45] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][49] ([i915#413]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [FAIL][51] ([i915#129]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-kbl4/igt@kms_color@pipe-c-ctm-green-to-red.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-kbl6/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [FAIL][53] ([i915#129]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl2/igt@kms_color@pipe-c-ctm-green-to-red.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl1/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [FAIL][58] ([IGT#28])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@in-flight-10ms:
    - shard-apl:          [TIMEOUT][59] ([fdo#112271]) -> [INCOMPLETE][60] ([CI#80] / [fdo#103927])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl6/igt@gem_eio@in-flight-10ms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl7/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@in-flight-1us:
    - shard-apl:          [TIMEOUT][61] ([fdo#112271]) -> [INCOMPLETE][62] ([CI#80] / [fdo#103927] / [i915#1098])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-apl8/igt@gem_eio@in-flight-1us.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-apl4/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@in-flight-immediate:
    - shard-kbl:          [INCOMPLETE][63] ([CI#80] / [fdo#103665] / [i915#1098]) -> [TIMEOUT][64] ([fdo#112271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-kbl7/igt@gem_eio@in-flight-immediate.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-kbl2/igt@gem_eio@in-flight-immediate.html
    - shard-glk:          [INCOMPLETE][65] ([CI#80] / [i915#1098] / [i915#58] / [k.org#198133]) -> [TIMEOUT][66] ([fdo#112271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-glk6/igt@gem_eio@in-flight-immediate.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-glk6/igt@gem_eio@in-flight-immediate.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb1/igt@i915_pm_rpm@pm-tiling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb1/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][69] ([i915#725]) -> [DMESG-FAIL][70] ([i915#553] / [i915#725])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-hsw2/igt@i915_selftest@live_blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-hsw1/igt@i915_selftest@live_blt.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77]) ([fdo#111870] / [i915#1077]) -> ([FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82]) ([fdo#111870] / [i915#1077] / [i915#698])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb6/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb1/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb1/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb1/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb2/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb5/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/shard-snb2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb1/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb1/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb4/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/shard-snb2/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
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
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1098]: https://gitlab.freedesktop.org/drm/intel/issues/1098
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4047
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7845: 87712fc2ff1634223e993da943bc3c9c7ce96bad @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4047: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4047/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
