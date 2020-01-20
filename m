Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 23:11:03 -0000
Message-ID: <157956186350.682.1636737795328159822@emeril.freedesktop.org>
References: <20200118154320.1016807-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200118154320.1016807-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_add_i915-query_perf_tests?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: add i915-query perf tests
URL   : https://patchwork.freedesktop.org/series/72235/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7772_full -> IGTPW_3944_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3944_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3944_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3944_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_query@query-perf-config-list-invalid (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb1/igt@i915_query@query-perf-config-list-invalid.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-hsw5/igt@i915_query@query-perf-config-list-invalid.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-kbl3/igt@i915_query@query-perf-config-list-invalid.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-apl2/igt@i915_query@query-perf-config-list-invalid.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-glk9/igt@i915_query@query-perf-config-list-invalid.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7772_full and IGTPW_3944_full:

### New IGT tests (3) ###

  * igt@i915_query@query-perf-config-data-invalid:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_query@query-perf-config-list-invalid:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_query@query-perf-configs:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_3944_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb3/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [PASS][8] -> [FAIL][9] ([i915#232])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@gem_eio@reset-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
    - shard-apl:          [PASS][12] -> [TIMEOUT][13] ([fdo#112271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-apl7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-kbl:          [PASS][16] -> [TIMEOUT][17] ([fdo#112271] / [i915#530])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-kbl1/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#109642] / [fdo#111068])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#173])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr@no_drrs.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb3/igt@kms_psr@psr2_dpms.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#112080]) +12 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109276]) +24 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][32] ([fdo#112080]) -> [PASS][33] +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][34] ([fdo#109276] / [fdo#112080]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][36] ([i915#140]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_balancer@hang.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][38] ([i915#677]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][40] ([fdo#109276]) -> [PASS][41] +16 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][42] ([fdo#112146]) -> [PASS][43] +5 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [TIMEOUT][44] ([fdo#112271] / [i915#530]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][46] ([i915#644]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][48] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][50] ([i915#454]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [INCOMPLETE][52] ([fdo#103665] / [i915#151]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-kbl6/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][54] ([i915#82]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@i915_selftest@mock_requests.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb2/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +11 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][58] ([i915#72]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][60] ([i915#49]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][62] ([i915#49]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_lease@cursor_implicit_plane:
    - shard-snb:          [SKIP][64] ([fdo#109271]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@kms_lease@cursor_implicit_plane.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb4/igt@kms_lease@cursor_implicit_plane.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][68] ([i915#31]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl2/igt@kms_setmode@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-apl2/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][70] ([fdo#109276] / [fdo#112080]) -> [FAIL][71] ([IGT#28])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][72] ([i915#82]) -> [DMESG-WARN][73] ([i915#444])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@gem_eio@kms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][74] ([i915#818]) -> [FAIL][75] ([i915#694])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][76] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][77] ([fdo#110789] / [fdo#111870] / [i915#478])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@runner@aborted:
    - shard-snb:          [FAIL][78] ([i915#873]) -> [FAIL][79] ([i915#436])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/shard-snb4/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3944
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7772: f65c394056d8637ff151fa83d5d1613adc0932d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3944: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3944/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
