Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 19:24:30 -0000
Message-ID: <157859787018.4565.7520917049920272166@emeril.freedesktop.org>
References: <20200109070441.27511-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200109070441.27511-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_update_the_test_with_close=28=29_for_prime_fd?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: update the test with close() for prime fd
URL   : https://patchwork.freedesktop.org/series/71805/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7705_full -> IGTPW_3907_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3907_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3907_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3907_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-pipe-d-planes:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb7/igt@kms_plane@pixel-format-pipe-d-planes.html

  
Known issues
------------

  Here are the changes found in IGTPW_3907_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#110841])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#461])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb2/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#112146]) +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111677] / [i915#472])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb9/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +15 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([i915#470] / [i915#475])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb8/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb3/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#454])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#413])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@i915_pm_rps@reset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-c-ctm-blue-to-red:
    - shard-tglb:         [PASS][24] -> [DMESG-WARN][25] ([i915#402])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb2/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb7/igt@kms_color@pipe-c-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#79])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#49]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][36] -> [DMESG-WARN][37] ([fdo#111764])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109642] / [fdo#111068])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb8/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#112080]) +9 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][44] ([fdo#109276] / [fdo#112080]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@gem_ctx_isolation@vcs1-none.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_eio@kms:
    - shard-tglb:         [INCOMPLETE][46] ([i915#476]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb8/igt@gem_eio@kms.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb3/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [INCOMPLETE][48] ([i915#470]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@gem_eio@reset-stress.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb3/igt@gem_eio@reset-stress.html

  * igt@gem_exec_await@wide-all:
    - shard-tglb:         [INCOMPLETE][50] ([fdo#111736] / [i915#472]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb8/igt@gem_exec_await@wide-all.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb3/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][52] ([fdo#110854]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@forked:
    - shard-apl:          [TIMEOUT][54] ([i915#940]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl1/igt@gem_exec_create@forked.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-apl4/igt@gem_exec_create@forked.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [INCOMPLETE][56] ([CI#80] / [i915#472]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb1/igt@gem_exec_create@madvise.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb5/igt@gem_exec_create@madvise.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [INCOMPLETE][58] ([fdo#111593] / [i915#472]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@gem_exec_gttfill@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb2/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][60] ([i915#677]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-vebox:
    - shard-tglb:         [INCOMPLETE][62] ([fdo#111677] / [i915#472]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb9/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][64] ([i915#463] / [i915#472]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb5/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][66] ([fdo#112146]) -> [PASS][67] +5 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][68] ([i915#472]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [FAIL][70] ([i915#520]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb8/igt@gem_persistent_relocs@forked-thrashing.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb1/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][72] ([fdo#111870]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [PASS][75] +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb8/igt@gem_wait@await-vcs1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@gem_wait@await-vcs1.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][78] ([i915#79]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-tglb:         [FAIL][80] ([i915#49]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane@pixel-format-pipe-c-planes-source-clamping:
    - shard-tglb:         [INCOMPLETE][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb2/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb9/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][84] ([fdo#109441]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][86] ([fdo#103665]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [FAIL][88] ([i915#84]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@perf@oa-exponents.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb1/igt@perf@oa-exponents.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][90] ([fdo#109276]) -> [PASS][91] +19 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][92] ([IGT#28]) -> [SKIP][93] ([fdo#109276] / [fdo#112080])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][94] ([fdo#109276] / [fdo#112080]) -> [FAIL][95] ([IGT#28])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][96] ([i915#82]) -> [DMESG-WARN][97] ([i915#444])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb4/igt@gem_eio@kms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][98] ([fdo#111870]) -> [DMESG-WARN][99] ([fdo#110789] / [fdo#111870])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [SKIP][100] ([fdo#109271]) -> [INCOMPLETE][101] ([i915#82])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb4/igt@i915_pm_dc@dc5-dpms.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-snb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking:
    - shard-tglb:         [SKIP][102] ([fdo#112021]) -> [SKIP][103] ([fdo#112016] / [fdo#112021]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-tglb7/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][104] ([i915#180]) -> [FAIL][105] ([i915#54])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][106] ([fdo#107724]) -> [SKIP][107] ([fdo#109349])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#475]: https://gitlab.freedesktop.org/drm/intel/issues/475
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3907
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7705: b57ea8cadecd3444690439b4703d964afca476e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3907: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
