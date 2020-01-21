Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 06:33:04 -0000
Message-ID: <157958838419.11479.2812246051875106241@emeril.freedesktop.org>
References: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCB0?=
 =?utf-8?q?iled_display_with_aid_of_chamelium=2E_=28rev2=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test tiled display with aid of chamelium. (rev2)
URL   : https://patchwork.freedesktop.org/series/71393/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5373_full -> IGTPW_3950_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3950_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3950_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3950_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html

  * {igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-glk7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-snb:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-kbl:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  
#### Warnings ####

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         [SKIP][9] ([i915#426]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern.html

  
New tests
---------

  New tests have been introduced between IGT_5373_full and IGTPW_3950_full:

### New IGT tests (1) ###

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.99] s

  

Known issues
------------

  Here are the changes found in IGTPW_3950_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112080]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#472] / [i915#977])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb8/igt@gem_busy@close-race.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb3/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([fdo#111735] / [i915#472])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb2/igt@gem_ctx_shared@q-smoketest-vebox.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb4/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb1/igt@gem_exec_create@madvise.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb8/igt@gem_exec_create@madvise.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#677])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([fdo#111677] / [i915#472])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109276]) +15 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_suspend@basic:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#460] / [i915#472])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb7/igt@gem_exec_suspend@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb3/igt@gem_exec_suspend@basic.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][31] -> [INCOMPLETE][32] ([CI#80] / [fdo#103927] / [i915#530])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-iclb:         [PASS][33] -> [INCOMPLETE][34] ([CI#80] / [i915#140] / [i915#530])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#530])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-snb:          [PASS][37] -> [DMESG-WARN][38] ([i915#478])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb1/igt@gem_set_tiling_vs_gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb2/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][39] -> [DMESG-WARN][40] ([fdo#111870] / [i915#478])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#454])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-glk:          [PASS][43] -> [INCOMPLETE][44] ([i915#58] / [k.org#198133])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-glk4/igt@i915_selftest@mock_requests.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-glk8/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#54])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#54])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#79])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-snb:          [PASS][53] -> [INCOMPLETE][54] ([CI#80] / [i915#82])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb4/igt@kms_force_connector_basic@prune-stale-modes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][55] -> [FAIL][56] ([i915#49])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109642] / [fdo#111068])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109441])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb8/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-b-query-busy:
    - shard-hsw:          [PASS][61] -> [DMESG-WARN][62] ([i915#44])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw5/igt@kms_vblank@pipe-b-query-busy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw5/igt@kms_vblank@pipe-b-query-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][63] -> [DMESG-WARN][64] ([i915#180]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][65] ([fdo#109276] / [fdo#112080]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb1/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [FAIL][67] ([i915#679]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl4/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl6/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [INCOMPLETE][69] ([i915#461] / [i915#472]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb5/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [INCOMPLETE][71] ([fdo#111736] / [i915#472]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb3/igt@gem_exec_create@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb4/igt@gem_exec_create@basic.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][75] ([i915#677]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb6/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +20 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][81] ([i915#463] / [i915#472]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb4/igt@gem_exec_schedule@smoketest-bsd1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb2/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [TIMEOUT][83] ([fdo#112271] / [i915#530]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][85] ([CI#80] / [fdo#103927] / [i915#530]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][87] ([i915#530] / [i915#61]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_softpin@noreloc-s3:
    - shard-hsw:          [DMESG-WARN][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw6/igt@gem_softpin@noreloc-s3.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [INCOMPLETE][91] ([i915#472] / [i915#707]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb3/igt@gem_sync@basic-each.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb4/igt@gem_sync@basic-each.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [INCOMPLETE][93] ([i915#472]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb1/igt@gem_sync@basic-store-all.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb2/igt@gem_sync@basic-store-all.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@reads.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][97] ([fdo#111870] / [i915#478]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][99] ([i915#716]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [INCOMPLETE][101] ([i915#455] / [i915#472]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb8/igt@i915_selftest@live_gt_timelines.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb7/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [INCOMPLETE][103] ([fdo#103927]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl6/igt@i915_selftest@mock_requests.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl4/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [INCOMPLETE][107] ([CI#80] / [fdo#103665]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-snb:          [INCOMPLETE][109] ([CI#80] / [i915#82]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][111] ([i915#180]) -> [PASS][112] +5 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [FAIL][113] ([i915#49]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][115] ([fdo#109441]) -> [PASS][116] +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb6/igt@kms_psr@psr2_sprite_render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][117] ([i915#31]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl2/igt@kms_setmode@basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][119] ([i915#61]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw1/igt@perf_pmu@cpu-hotplug.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][121] ([fdo#109276] / [fdo#112080]) -> [FAIL][122] ([IGT#28])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][123] ([i915#444]) -> [INCOMPLETE][124] ([i915#82])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb5/igt@gem_eio@kms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb2/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][125] ([i915#818]) -> [FAIL][126] ([i915#694])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw7/igt@gem_tiled_blits@normal.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][127] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][128] ([fdo#111870] / [i915#478])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-snb:          [SKIP][129] ([fdo#109271]) -> [INCOMPLETE][130] ([i915#82])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb6/igt@i915_pm_dc@dc6-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-snb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][131] ([i915#454]) -> [SKIP][132] ([i915#468])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb4/igt@i915_pm_dc@dc6-psr.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][133] ([i915#180]) -> [INCOMPLETE][134] ([fdo#103665])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][135], [FAIL][136]) ([i915#873] / [i915#997]) -> ([FAIL][137], [FAIL][138]) ([i915#997])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl8/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][139], [FAIL][140]) ([i915#997] / [k.org#202321]) -> ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#873] / [i915#997] / [k.org#202321])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-glk9/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-glk9/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-glk5/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-glk6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/shard-glk8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#973]: https://gitlab.freedesktop.org/drm/intel/issues/973
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5373 -> IGTPW_3950

  CI-20190529: 20190529
  CI_DRM_7778: 8442e59b2b3aa0f081ee31fc13dcd0f31e5981e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3950: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3950/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
