Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 20:37:22 -0000
Message-ID: <157860224297.4564.5403333521711518766@emeril.freedesktop.org>
References: <20200109085023.25551-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200109085023.25551-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes?=
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines
URL   : https://patchwork.freedesktop.org/series/71810/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7705_full -> IGTPW_3908_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3908_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3908_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3908_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_persistent_relocs@forked-faulting-reloc:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb6/igt@gem_persistent_relocs@forked-faulting-reloc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-snb4/igt@gem_persistent_relocs@forked-faulting-reloc.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl3/igt@i915_pm_rps@reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-apl1/igt@i915_pm_rps@reset.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-apl:          [FAIL][5] ([i915#940]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-apl1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_3908_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [fdo#112080])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@gem_ctx_isolation@vcs1-reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb3/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_shared@q-smoketest-blt:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([fdo#111735])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb1/igt@gem_ctx_shared@q-smoketest-blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb9/igt@gem_ctx_shared@q-smoketest-blt.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#472] / [i915#476])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb2/igt@gem_exec_parallel@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb8/igt@gem_exec_parallel@basic.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276]) +20 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([fdo#111677] / [i915#472]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([fdo#111606] / [fdo#111677] / [i915#472])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#463] / [i915#472])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb5/igt@gem_exec_schedule@smoketest-all.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb2/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#460] / [i915#472])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb9/igt@gem_exec_suspend@basic-s3-devices.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb3/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][27] -> [FAIL][28] ([i915#520])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#644])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#716])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#447])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#413])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#54])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#49]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109642] / [fdo#111068])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#112080]) +17 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +9 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][57] ([fdo#109276] / [fdo#112080]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb3/igt@gem_ctx_isolation@vcs1-none.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_await@wide-all:
    - shard-tglb:         [INCOMPLETE][59] ([fdo#111736] / [i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb8/igt@gem_exec_await@wide-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb1/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][61] ([fdo#110854]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@forked:
    - shard-apl:          [TIMEOUT][63] ([i915#940]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl1/igt@gem_exec_create@forked.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-apl6/igt@gem_exec_create@forked.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [INCOMPLETE][65] ([fdo#111593] / [i915#472]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@gem_exec_gttfill@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb1/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_reuse@single:
    - shard-tglb:         [INCOMPLETE][67] ([CI#80] / [i915#472]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb3/igt@gem_exec_reuse@single.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb6/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][69] ([i915#677]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][71] ([fdo#112146]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb5/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][73] ([i915#463] / [i915#472]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb5/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [FAIL][75] ([i915#520]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb8/igt@gem_persistent_relocs@forked-thrashing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb1/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][81] ([i915#79]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-pipe-c-planes-source-clamping:
    - shard-tglb:         [INCOMPLETE][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb2/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb5/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][91] ([fdo#103665]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [FAIL][93] ([i915#84]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb6/igt@perf@oa-exponents.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb5/igt@perf@oa-exponents.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][95] ([fdo#109276]) -> [PASS][96] +11 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][97] ([fdo#109276] / [fdo#112080]) -> [SKIP][98] ([fdo#112080]) +8 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@kms_atomic_transition@6x-modeset-transitions-fencing:
    - shard-tglb:         [SKIP][99] ([fdo#112021]) -> [SKIP][100] ([fdo#112016] / [fdo#112021])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-fencing.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-tglb1/igt@kms_atomic_transition@6x-modeset-transitions-fencing.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][101] ([fdo#107724]) -> [SKIP][102] ([fdo#109349])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3908
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7705: b57ea8cadecd3444690439b4703d964afca476e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3908: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
