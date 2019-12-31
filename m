Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Dec 2019 08:45:26 -0000
Message-ID: <157778192603.26888.17078395684142418091@emeril.freedesktop.org>
References: <20191230034040.21943-1-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBB?=
 =?utf-8?q?dd_support_and_coverage_for_MC_YUV_formats_=28rev3=29?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Add support and coverage for MC YUV formats (rev3)
URL   : https://patchwork.freedesktop.org/series/71483/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7656_full -> IGTPW_3892_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/index.html

Known issues
------------

  Here are the changes found in IGTPW_3892_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-apl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110854])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111736])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@gem_exec_create@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb5/igt@gem_exec_create@basic.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +18 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb9/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb9/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-chain-render:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#111606] / [fdo#111677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@gem_exec_schedule@preempt-queue-chain-render.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb3/igt@gem_exec_schedule@preempt-queue-chain-render.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#463])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb1/igt@gem_exec_schedule@smoketest-bsd1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb9/igt@gem_exec_suspend@basic-s0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb3/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#447])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb1/igt@i915_pm_dc@dc5-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [PASS][25] -> [INCOMPLETE][26] ([fdo#103927])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-apl4/igt@i915_selftest@mock_requests.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-apl3/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#79])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb3/igt@kms_psr@psr2_suspend.html

  * igt@perf@short-reads:
    - shard-kbl:          [PASS][37] -> [TIMEOUT][38] ([i915#51])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-kbl4/igt@perf@short-reads.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-kbl1/igt@perf@short-reads.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#112080]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@enable-race-vcs0:
    - shard-tglb:         [PASS][41] -> [INCOMPLETE][42] ([i915#480])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@perf_pmu@enable-race-vcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb2/igt@perf_pmu@enable-race-vcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb3/igt@gem_ctx_isolation@vcs1-none.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_eio@kms:
    - shard-tglb:         [INCOMPLETE][45] ([i915#476]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb1/igt@gem_eio@kms.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb8/igt@gem_eio@kms.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * {igt@gem_exec_schedule@pi-userfault-bsd}:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +18 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-chain-vebox:
    - shard-tglb:         [INCOMPLETE][53] ([fdo#111677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@gem_exec_schedule@preempt-queue-chain-vebox.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb9/igt@gem_exec_schedule@preempt-queue-chain-vebox.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-blt:
    - shard-tglb:         [INCOMPLETE][55] ([fdo#111606] / [fdo#111677]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html

  * igt@gem_exec_schedule@smoketest-blt:
    - shard-tglb:         [INCOMPLETE][57] ([i915#470]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb3/igt@gem_exec_schedule@smoketest-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb3/igt@gem_exec_schedule@smoketest-blt.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][59] ([i915#520]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-tglb:         [FAIL][61] ([i915#520]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb9/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [INCOMPLETE][65] ([i915#470] / [i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb5/igt@gem_sync@basic-all.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb1/igt@gem_sync@basic-all.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [INCOMPLETE][67] ([i915#435] / [i915#472]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb8/igt@gem_sync@basic-store-each.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb2/igt@gem_sync@basic-store-each.html

  * igt@gem_tiled_wc:
    - shard-snb:          [DMESG-WARN][69] ([i915#915]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-snb4/igt@gem_tiled_wc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-snb4/igt@gem_tiled_wc.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][71] ([fdo#111870]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb7/igt@i915_hangman@error-state-capture-vcs1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][75] ([i915#413]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [INCOMPLETE][77] ([i915#472]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb9/igt@i915_selftest@live_requests.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb8/igt@i915_selftest@live_requests.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [FAIL][79] ([i915#79]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-glk1/igt@kms_frontbuffer_tracking@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-glk6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [FAIL][83] ([i915#49]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][89] ([i915#31]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-apl6/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][93] ([fdo#109276] / [fdo#112080]) -> [FAIL][94] ([IGT#28])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][95] ([i915#82]) -> [DMESG-WARN][96] ([i915#444] / [i915#503])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-snb4/igt@gem_eio@kms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][97] ([i915#832]) -> [FAIL][98] ([i915#818])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][99] ([fdo#103665]) -> [DMESG-WARN][100] ([i915#180])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-kbl6/igt@i915_suspend@debugfs-reader.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][101] ([fdo#109349]) -> [DMESG-WARN][102] ([fdo#107724])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][103] ([i915#180]) -> [FAIL][104] ([fdo#103375])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7656/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/shard-apl4/igt@kms_flip@flip-vs-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#480]: https://gitlab.freedesktop.org/drm/intel/issues/480
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#503]: https://gitlab.freedesktop.org/drm/intel/issues/503
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832
  [i915#915]: https://gitlab.freedesktop.org/drm/intel/issues/915


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5355 -> IGTPW_3892
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7656: 635576de746ef28c1635b4cf4fb12f4db1104f8b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3892: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/index.html
  IGT_5355: 2ead76177f2546d3eec0abbd0d9e47cd36588199 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3892/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
