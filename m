Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jan 2020 16:02:42 -0000
Message-ID: <157867216283.30836.10618289646905876948@emeril.freedesktop.org>
References: <20200109183338.17164-1-bob.j.paauwe@intel.com>
In-Reply-To: <20200109183338.17164-1-bob.j.paauwe@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2Nv?=
 =?utf-8?q?lor=5Fencoding=3A_Fix_up_support_for_XYUV_format=2E_=28rev2=29?=
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
To: Bob Paauwe <bob.j.paauwe@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/color_encoding: Fix up support for XYUV format. (rev2)
URL   : https://patchwork.freedesktop.org/series/70516/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7713_full -> IGTPW_3911_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3911_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3911_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3911_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-wc-gtt-active:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-snb6/igt@gem_exec_reloc@basic-wc-gtt-active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-snb2/igt@gem_exec_reloc@basic-wc-gtt-active.html

  
Known issues
------------

  Here are the changes found in IGTPW_3911_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-glk8/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-glk5/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#461])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb2/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [PASS][11] -> [FAIL][12] ([i915#490])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-snb6/igt@gem_eio@in-flight-contexts-1us.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-snb2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#476])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb4/igt@gem_eio@kms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb1/igt@gem_eio@kms.html

  * igt@gem_exec_await@wide-all:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#111736] / [i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb2/igt@gem_exec_await@wide-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb3/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([CI#80] / [i915#472]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb5/igt@gem_exec_nop@basic-series.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb3/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#470] / [i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb7/igt@gem_exec_parallel@contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb6/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109276]) +17 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#472] / [i915#707]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb7/igt@gem_exec_schedule@smoketest-bsd2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#644])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#454])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_hangcheck:
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([CI#80])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb2/igt@i915_selftest@live_hangcheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb6/igt@i915_selftest@live_hangcheck.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([fdo#108145] / [i915#71])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-apl3/igt@kms_color@pipe-a-legacy-gamma.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-apl1/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([fdo#108145] / [i915#71])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl2/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#79])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#34])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#49])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-iclb:         [PASS][49] -> [DMESG-WARN][50] ([fdo#111764])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#112080]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +11 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-kbl:          [INCOMPLETE][59] ([fdo#103665]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl6/igt@gem_ctx_isolation@vecs0-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl1/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][61] ([fdo#109276] / [fdo#112080]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb8/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb4/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111736] / [i915#472]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb6/igt@gem_exec_await@wide-contexts.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb5/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][65] ([fdo#110854]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@forked:
    - shard-kbl:          [TIMEOUT][67] ([i915#940]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl3/igt@gem_exec_create@forked.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl4/igt@gem_exec_create@forked.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-tglb:         [INCOMPLETE][69] ([CI#80] / [i915#472]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb5/igt@gem_exec_nop@basic-sequential.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb5/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][73] ([fdo#112146]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +16 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [INCOMPLETE][77] ([fdo#111677] / [i915#472]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][79] ([i915#463] / [i915#472]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb1/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-hsw:          [TIMEOUT][81] ([i915#530]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-tglb:         [TIMEOUT][83] ([fdo#112126] / [i915#530]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][85] ([i915#454]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][87] ([i915#413]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-iclb8/igt@i915_pm_rps@reset.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][89] ([i915#725]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-hsw7/igt@i915_selftest@live_blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [INCOMPLETE][93] ([fdo#103665] / [i915#600]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [FAIL][95] ([i915#49]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][99] ([i915#460]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][101] ([fdo#111870]) -> [DMESG-WARN][102] ([fdo#110789] / [fdo#111870])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [INCOMPLETE][104] ([fdo#103665])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][105] ([i915#468]) -> [FAIL][106] ([i915#454])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3911
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7713: f80e30343f272fc966b28277a929e7f7469653bd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3911: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
