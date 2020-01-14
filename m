Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jan 2020 10:10:48 -0000
Message-ID: <157899664814.24909.12940935475662363313@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev4=29?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev4)
URL   : https://patchwork.freedesktop.org/series/71194/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7719_full -> IGTPW_3915_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3915_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc-copy} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb8/igt@gem_huc_copy@huc-copy.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7719_full and IGTPW_3915_full:

### New IGT tests (1) ###

  * igt@gem_huc_copy@huc-copy:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_3915_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([fdo#111735])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb5/igt@gem_ctx_shared@q-smoketest-all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb3/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([i915#476])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb4/igt@gem_eio@kms.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb3/igt@gem_eio@kms.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +10 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_await@wide-all:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111736] / [i915#472]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb4/igt@gem_exec_await@wide-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb6/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#110854])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([i915#472])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb2/igt@gem_exec_nop@basic-series.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb4/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#470] / [i915#472]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb2/igt@gem_exec_parallel@contexts.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb3/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([i915#677])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#644])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#79])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#49])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#49]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109276]) +20 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][40] ([fdo#109276] / [fdo#112080]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][42] ([fdo#110841]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [TIMEOUT][44] ([fdo#112271] / [i915#940]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk9/igt@gem_exec_create@forked.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-glk2/igt@gem_exec_create@forked.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [INCOMPLETE][46] ([i915#472]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb7/igt@gem_exec_create@madvise.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb7/igt@gem_exec_create@madvise.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][48] ([fdo#112146]) -> [PASS][49] +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][50] ([i915#716]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][52] ([i915#413]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb7/igt@i915_pm_rps@reset.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-snb:          [SKIP][54] ([fdo#109271]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-snb1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-snb5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180:
    - shard-tglb:         [FAIL][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-rotation-180.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-rotation-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [FAIL][62] ([i915#49]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][64] ([fdo#109642] / [fdo#111068]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [INCOMPLETE][68] ([i915#472] / [i915#807]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb4/igt@perf@oa-exponents.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb5/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][70] ([fdo#112080]) -> [PASS][71] +10 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][72] ([fdo#109276]) -> [PASS][73] +20 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][74] ([IGT#28]) -> [SKIP][75] ([fdo#109276] / [fdo#112080])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][76] ([i915#444]) -> [INCOMPLETE][77] ([i915#82])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-snb1/igt@gem_eio@kms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [TIMEOUT][78] ([fdo#112271] / [i915#530]) -> [INCOMPLETE][79] ([i915#140] / [i915#530])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-iclb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-iclb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][80] ([i915#818]) -> [FAIL][81] ([i915#694])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-hsw5/igt@gem_tiled_blits@normal.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][82] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][83] ([fdo#111870])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][84] ([fdo#111870]) -> [DMESG-WARN][85] ([fdo#110789] / [fdo#111870])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][86] ([i915#468]) -> [FAIL][87] ([i915#454])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-snb:          [INCOMPLETE][88] ([i915#82]) -> [SKIP][89] ([fdo#109271])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-snb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-snb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_atomic_transition@6x-modeset-transitions-fencing:
    - shard-tglb:         [SKIP][90] ([fdo#112016] / [fdo#112021]) -> [SKIP][91] ([fdo#112021])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-tglb3/igt@kms_atomic_transition@6x-modeset-transitions-fencing.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-fencing.html

  * igt@runner@aborted:
    - shard-glk:          ([FAIL][92], [FAIL][93], [FAIL][94]) ([i915#940] / [k.org#202321]) -> [FAIL][95] ([k.org#202321])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7719/shard-glk9/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#807]: https://gitlab.freedesktop.org/drm/intel/issues/807
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5363 -> IGTPW_3915
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7719: 8be213204694b671bd894aced16be510d84d16d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3915: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/index.html
  IGT_5363: 2d453ec48fbda1f4f7ddaf69060be3992f28f680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3915/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
