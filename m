Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7458033251532233533=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 07 Mar 2023 00:02:50 -0000
Message-ID: <167814737017.31454.17781693891175062179@emeril.freedesktop.org>
References: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_check_disk_limit_at_dumping_kmsg_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7458033251532233533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: check disk limit at dumping kmsg (rev2)
URL   : https://patchwork.freedesktop.org/series/114353/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12786_full -> IGTPW_8532_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8532_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8532_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-dg2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8532_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-wait-all:
    - shard-snb:          NOTRUN -> ([ABORT][1], [ABORT][2]) ([i915#8250])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb1/igt@gem_exec_fence@basic-wait-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_exec_fence@basic-wait-all.html

  * igt@gem_exec_fence@long-history:
    - shard-glk:          NOTRUN -> [ABORT][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fence@long-history.html

  * igt@gem_exec_fence@submit3:
    - shard-snb:          NOTRUN -> ([ABORT][4], [ABORT][5])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@gem_exec_fence@submit3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb1/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [ABORT][6] +13 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html
    - shard-glk:          NOTRUN -> ([ABORT][7], [ABORT][8]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_fence@syncobj-timeline-repeat:
    - shard-glk:          NOTRUN -> ([ABORT][9], [ABORT][10]) ([i915#8233])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@gem_exec_fence@syncobj-timeline-repeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fence@syncobj-timeline-repeat.html

  * igt@gem_exec_schedule@reorder-wide@rcs0:
    - shard-apl:          NOTRUN -> ([ABORT][11], [ABORT][12]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@gem_exec_schedule@reorder-wide@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_exec_schedule@reorder-wide@rcs0.html

  * igt@gem_ringfill@engines-basic@rcs0:
    - shard-apl:          NOTRUN -> ([ABORT][13], [ABORT][14]) ([i915#8233])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_ringfill@engines-basic@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_ringfill@engines-basic@rcs0.html

  * igt@perf_pmu@interrupts-sync:
    - shard-apl:          NOTRUN -> [ABORT][15] +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@perf_pmu@interrupts-sync.html

  * igt@prime_vgem@fence-wait@rcs0:
    - shard-apl:          NOTRUN -> ([ABORT][16], [ABORT][17]) ([i915#8245])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl7/igt@prime_vgem@fence-wait@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@prime_vgem@fence-wait@rcs0.html
    - shard-tglu-10:      NOTRUN -> [ABORT][18] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@prime_vgem@fence-wait@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_fence@keep-in-fence@vecs0:
    - shard-apl:          [ABORT][19] ([i915#8233]) -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-apl3/igt@gem_exec_fence@keep-in-fence@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@gem_exec_fence@keep-in-fence@vecs0.html

  * igt@gem_exec_fence@syncobj-export:
    - shard-apl:          [ABORT][21] ([i915#8233]) -> ([ABORT][22], [ABORT][23]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-apl1/igt@gem_exec_fence@syncobj-export.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_exec_fence@syncobj-export.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_exec_fence@syncobj-export.html
    - shard-glk:          [ABORT][24] ([i915#8233]) -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-glk4/igt@gem_exec_fence@syncobj-export.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_exec_fence@syncobj-export.html

  * igt@perf_pmu@interrupts-sync:
    - shard-snb:          [ABORT][26] ([i915#8233]) -> [ABORT][27] +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-snb4/igt@perf_pmu@interrupts-sync.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@perf_pmu@interrupts-sync.html
    - shard-glk:          [ABORT][28] ([i915#8233]) -> ([ABORT][29], [ABORT][30]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-glk9/igt@perf_pmu@interrupts-sync.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@perf_pmu@interrupts-sync.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@perf_pmu@interrupts-sync.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@device_reset@unbind-reset-rebind:
    - {shard-dg1}:        NOTRUN -> ([ABORT][31], [ABORT][32]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_fence@expired-history:
    - {shard-dg1}:        NOTRUN -> ([ABORT][33], [ABORT][34]) ([i915#8233])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-13/igt@gem_exec_fence@expired-history.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-18/igt@gem_exec_fence@expired-history.html

  * igt@gem_exec_fence@long-history:
    - {shard-tglu}:       NOTRUN -> ([ABORT][35], [ABORT][36]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-5/igt@gem_exec_fence@long-history.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-1/igt@gem_exec_fence@long-history.html

  * igt@gem_exec_fence@submit:
    - {shard-dg1}:        NOTRUN -> [ABORT][37] +12 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-15/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit3@vecs0:
    - {shard-rkl}:        NOTRUN -> ([ABORT][38], [ABORT][39]) +7 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-4/igt@gem_exec_fence@submit3@vecs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fence@submit3@vecs0.html

  * igt@gem_exec_fence@submit@vecs0:
    - {shard-tglu}:       NOTRUN -> [ABORT][40] +11 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-4/igt@gem_exec_fence@submit@vecs0.html

  * igt@gem_exec_fence@syncobj-export:
    - {shard-rkl}:        [ABORT][41] ([i915#8233]) -> ([ABORT][42], [ABORT][43])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-6/igt@gem_exec_fence@syncobj-export.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-1/igt@gem_exec_fence@syncobj-export.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fence@syncobj-export.html
    - {shard-dg1}:        [ABORT][44] ([i915#8233]) -> ([ABORT][45], [ABORT][46]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-13/igt@gem_exec_fence@syncobj-export.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-14/igt@gem_exec_fence@syncobj-export.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-15/igt@gem_exec_fence@syncobj-export.html
    - {shard-tglu}:       [ABORT][47] ([i915#8233]) -> ([ABORT][48], [ABORT][49])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-tglu-4/igt@gem_exec_fence@syncobj-export.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-8/igt@gem_exec_fence@syncobj-export.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-2/igt@gem_exec_fence@syncobj-export.html

  * igt@gem_exec_fence@syncobj-invalid-flags:
    - {shard-rkl}:        [ABORT][50] ([i915#8233]) -> [ABORT][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-5/igt@gem_exec_fence@syncobj-invalid-flags.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-2/igt@gem_exec_fence@syncobj-invalid-flags.html

  * igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:
    - {shard-dg2}:        NOTRUN -> [ABORT][52] +21 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg2-8/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html
    - {shard-dg1}:        [ABORT][53] ([i915#8233]) -> [ABORT][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-15/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-13/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html

  * igt@gem_exec_schedule@reorder-wide@rcs0:
    - {shard-rkl}:        NOTRUN -> [ABORT][55] +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-6/igt@gem_exec_schedule@reorder-wide@rcs0.html

  * igt@gem_exec_schedule@wide@bcs0:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-18/igt@gem_exec_schedule@wide@bcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - {shard-rkl}:        [ABORT][57] ([i915#7975]) -> [ABORT][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - {shard-dg2}:        NOTRUN -> [INCOMPLETE][59]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12786_full and IGTPW_8532_full:

### New IGT tests (6) ###

  * igt@kms_color@legacy-gamma@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8532_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([fdo#109271] / [i915#1099])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_ctx_persistence@engines-mixed.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb5/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#1099]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-10:      NOTRUN -> [SKIP][63] ([i915#280])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> ([FAIL][64], [FAIL][65]) ([i915#2846])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_exec_fair@basic-deadline.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          NOTRUN -> ([PASS][66], [FAIL][67]) ([i915#2846])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][68] ([i915#2842])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#2842]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-glk3/igt@gem_exec_fair@basic-pace@vcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fence@basic-wait-all:
    - shard-apl:          NOTRUN -> [ABORT][71] ([i915#8250])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_exec_fence@basic-wait-all.html

  * igt@gem_exec_fence@expired-history:
    - shard-glk:          NOTRUN -> ([ABORT][72], [ABORT][73]) ([i915#8233] / [i915#8250])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk8/igt@gem_exec_fence@expired-history.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fence@expired-history.html
    - shard-apl:          NOTRUN -> ([ABORT][74], [ABORT][75]) ([i915#8233])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@gem_exec_fence@expired-history.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_exec_fence@expired-history.html

  * igt@gem_exec_fence@submit@vecs0:
    - shard-glk:          NOTRUN -> [ABORT][76] ([i915#8250])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk5/igt@gem_exec_fence@submit@vecs0.html

  * igt@gem_exec_fence@syncobj-timeline-export:
    - shard-tglu-10:      NOTRUN -> [ABORT][77] ([i915#8250]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_exec_fence@syncobj-timeline-export.html

  * igt@gem_exec_schedule@pi-common@rcs0:
    - shard-glk:          NOTRUN -> ([ABORT][78], [ABORT][79]) ([i915#8250])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk9/igt@gem_exec_schedule@pi-common@rcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_schedule@pi-common@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> ([SKIP][80], [SKIP][81]) ([fdo#109271] / [i915#4613]) +5 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#4613]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive:
    - shard-apl:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([fdo#109271] / [i915#4613]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_lmem_swapping@massive.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#4613]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> ([ABORT][86], [ABORT][87]) ([i915#8233])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@gem_pwrite@basic-exhaustion.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([fdo#109271]) +134 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-snb:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([fdo#109271]) +69 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb5/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_ringfill@engines-basic@vecs0:
    - shard-apl:          NOTRUN -> ([DMESG-WARN][92], [PASS][93]) ([i915#8250])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_ringfill@engines-basic@vecs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_ringfill@engines-basic@vecs0.html
    - shard-glk:          NOTRUN -> ([DMESG-WARN][94], [PASS][95]) ([i915#8233])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_ringfill@engines-basic@vecs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@gem_ringfill@engines-basic@vecs0.html

  * igt@gem_ringfill@legacy-basic@vebox:
    - shard-apl:          NOTRUN -> [DMESG-WARN][96] ([i915#8250])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_ringfill@legacy-basic@vebox.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([fdo#109271] / [i915#3323])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#3323])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglu-10:      NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gen9_exec_parse@shadow-peek.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> ([PASS][101], [FAIL][102]) ([i915#2521])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][103] ([fdo#111614]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][104] ([fdo#111615]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][105] ([i915#3689] / [i915#3886])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> ([SKIP][106], [SKIP][107]) ([fdo#109271] / [i915#3886]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][108] ([fdo#111615] / [i915#3689])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#3886]) +7 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu-10:      NOTRUN -> [SKIP][110] ([i915#3689] / [i915#6095])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([fdo#109271] / [i915#3886]) +8 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][113] ([i915#6095]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#3886]) +3 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][115] ([i915#3689])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu-10:      NOTRUN -> [SKIP][116] ([i915#7828])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][117] ([i915#7173])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][118] ([i915#3359])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-tglu-10:      NOTRUN -> [SKIP][119] ([fdo#109274])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          NOTRUN -> ([FAIL][120], [FAIL][121]) ([i915#2346])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          NOTRUN -> [FAIL][122] ([i915#2346])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271]) +78 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglu-10:      NOTRUN -> [SKIP][124] ([fdo#110189]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([fdo#109271]) +122 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-10:      NOTRUN -> [SKIP][127] ([i915#5439])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglu-10:      NOTRUN -> [SKIP][128] ([fdo#109280]) +9 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-10:      NOTRUN -> [SKIP][129] ([fdo#109289])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> ([FAIL][130], [FAIL][131]) ([i915#4573]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> ([FAIL][132], [FAIL][133]) ([i915#4573]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-10:      NOTRUN -> [SKIP][134] ([fdo#112054] / [i915#5288])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu-10:      NOTRUN -> [SKIP][135] ([i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][136] ([i915#5176]) +3 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> ([SKIP][137], [SKIP][138]) ([fdo#109271] / [i915#658]) +2 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglu-10:      NOTRUN -> [SKIP][139] ([fdo#111068] / [i915#658])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([fdo#109271] / [i915#658]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#658])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-apl:          NOTRUN -> [SKIP][143] ([fdo#109271]) +95 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][144] ([fdo#111615] / [i915#5289])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vblank@pipe-c-query-busy-hang:
    - shard-snb:          NOTRUN -> [SKIP][145] ([fdo#109271]) +278 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@kms_vblank@pipe-c-query-busy-hang.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([fdo#109271] / [i915#2437])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu-10:      NOTRUN -> [SKIP][148] ([i915#2437])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@prime_vgem@fence-wait@rcs0:
    - shard-snb:          NOTRUN -> ([ABORT][149], [ABORT][150]) ([i915#8245])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@prime_vgem@fence-wait@rcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb5/igt@prime_vgem@fence-wait@rcs0.html

  * igt@prime_vgem@wait@rcs0:
    - shard-apl:          NOTRUN -> [ABORT][151] ([i915#8233])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@prime_vgem@wait@rcs0.html

  * igt@prime_vgem@wait@vcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][152] ([i915#8233]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@prime_vgem@wait@vcs0.html

  * igt@v3d/v3d_perfmon@create-single-perfmon:
    - shard-tglu-10:      NOTRUN -> [SKIP][153] ([fdo#109315] / [i915#2575]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@v3d/v3d_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-tglu-10:      NOTRUN -> [SKIP][154] ([i915#2575])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@vc4/vc4_perfmon@create-single-perfmon.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][155] ([i915#7742]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_ctx_persistence@hang:
    - {shard-rkl}:        [SKIP][157] ([i915#6252]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-5/igt@gem_ctx_persistence@hang.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-2/igt@gem_ctx_persistence@hang.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - {shard-rkl}:        [FAIL][159] ([i915#2842]) -> [PASS][160] +2 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - {shard-dg1}:        [SKIP][161] ([i915#1397]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - {shard-rkl}:        [SKIP][163] ([i915#1845] / [i915#4098]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5410]: https://gitlab.freedesktop.org/drm/intel/issues/5410
  [i915#5433]: https://gitlab.freedesktop.org/drm/intel/issues/5433
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8233]: https://gitlab.freedesktop.org/drm/intel/issues/8233
  [i915#8245]: https://gitlab.freedesktop.org/drm/intel/issues/8245
  [i915#8250]: https://gitlab.freedesktop.org/drm/intel/issues/8250


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7173 -> IGTPW_8532
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12786: f182ba6684a2393069248bc946f20ceabd9e395d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8532: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html
  IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html

--===============7458033251532233533==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>runner: check disk limit at dumping kmsg (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114353/">https://patchwork.freedesktop.org/series/114353/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12786_full -&gt; IGTPW_8532_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8532_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8532_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-dg2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8532_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-wait-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb1/igt@gem_exec_fence@basic-wait-all.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_exec_fence@basic-wait-all.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@long-history:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fence@long-history.html">ABORT</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@gem_exec_fence@submit3.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb1/igt@gem_exec_fence@submit3.html">ABORT</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">ABORT</a> +13 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">ABORT</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-repeat:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@gem_exec_fence@syncobj-timeline-repeat.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fence@syncobj-timeline-repeat.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@gem_exec_schedule@reorder-wide@rcs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_exec_schedule@reorder-wide@rcs0.html">ABORT</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-basic@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_ringfill@engines-basic@rcs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_ringfill@engines-basic@rcs0.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@perf_pmu@interrupts-sync.html">ABORT</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-wait@rcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl7/igt@prime_vgem@fence-wait@rcs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@prime_vgem@fence-wait@rcs0.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8245">i915#8245</a>)</p>
</li>
<li>
<p>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@prime_vgem@fence-wait@rcs0.html">ABORT</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fence@keep-in-fence@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-apl3/igt@gem_exec_fence@keep-in-fence@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@gem_exec_fence@keep-in-fence@vecs0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-export:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-apl1/igt@gem_exec_fence@syncobj-export.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_exec_fence@syncobj-export.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_exec_fence@syncobj-export.html">ABORT</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-glk4/igt@gem_exec_fence@syncobj-export.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_exec_fence@syncobj-export.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts-sync:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-snb4/igt@perf_pmu@interrupts-sync.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@perf_pmu@interrupts-sync.html">ABORT</a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-glk9/igt@perf_pmu@interrupts-sync.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@perf_pmu@interrupts-sync.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@perf_pmu@interrupts-sync.html">ABORT</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html">ABORT</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@expired-history:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-13/igt@gem_exec_fence@expired-history.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-18/igt@gem_exec_fence@expired-history.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@long-history:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-5/igt@gem_exec_fence@long-history.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-1/igt@gem_exec_fence@long-history.html">ABORT</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-15/igt@gem_exec_fence@submit.html">ABORT</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3@vecs0:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-4/igt@gem_exec_fence@submit3@vecs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fence@submit3@vecs0.html">ABORT</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit@vecs0:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-4/igt@gem_exec_fence@submit@vecs0.html">ABORT</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-export:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-6/igt@gem_exec_fence@syncobj-export.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-1/igt@gem_exec_fence@syncobj-export.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fence@syncobj-export.html">ABORT</a>)</p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-13/igt@gem_exec_fence@syncobj-export.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-14/igt@gem_exec_fence@syncobj-export.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-15/igt@gem_exec_fence@syncobj-export.html">ABORT</a>) +1 similar issue</p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-tglu-4/igt@gem_exec_fence@syncobj-export.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-8/igt@gem_exec_fence@syncobj-export.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-2/igt@gem_exec_fence@syncobj-export.html">ABORT</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-invalid-flags:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-5/igt@gem_exec_fence@syncobj-invalid-flags.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-2/igt@gem_exec_fence@syncobj-invalid-flags.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:</p>
<ul>
<li>
<p>{shard-dg2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg2-8/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html">ABORT</a> +21 similar issues</p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-15/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-13/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html">ABORT</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide@rcs0:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-6/igt@gem_exec_schedule@reorder-wide@rcs0.html">ABORT</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@wide@bcs0:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-18/igt@gem_exec_schedule@wide@bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>{shard-dg2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12786_full and IGTPW_8532_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8532_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb5/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-glk3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait-all:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_exec_fence@basic-wait-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@expired-history:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk8/igt@gem_exec_fence@expired-history.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_fence@expired-history.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@gem_exec_fence@expired-history.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_exec_fence@expired-history.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit@vecs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk5/igt@gem_exec_fence@submit@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-export:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gem_exec_fence@syncobj-timeline-export.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk9/igt@gem_exec_schedule@pi-common@rcs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_exec_schedule@pi-common@rcs0.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_lmem_swapping@massive.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_lmem_swapping@massive.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@gem_pwrite@basic-exhaustion.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_pwrite@basic-exhaustion.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +134 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb5/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +69 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@engines-basic@vecs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_ringfill@engines-basic@vecs0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@gem_ringfill@engines-basic@vecs0.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_ringfill@engines-basic@vecs0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@gem_ringfill@engines-basic@vecs0.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@legacy-basic@vebox:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_ringfill@legacy-basic@vebox.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8250">i915#8250</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +78 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +122 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-glk7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +95 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb6/igt@kms_vblank@pipe-c-query-busy-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +278 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-wait@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb4/igt@prime_vgem@fence-wait@rcs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-snb5/igt@prime_vgem@fence-wait@rcs0.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8245">i915#8245</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@wait@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@prime_vgem@wait@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@wait@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-apl3/igt@prime_vgem@wait@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@v3d/v3d_perfmon@create-single-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-tglu-10/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-2/igt@gem_ctx_persistence@hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/shard-rkl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7173 -&gt; IGTPW_8532</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12786: f182ba6684a2393069248bc946f20ceabd9e395d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8532: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html<br />
  IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7458033251532233533==--
