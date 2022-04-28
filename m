Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6791763436643749869=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 28 Apr 2022 18:24:15 -0000
Message-ID: <165117025508.29089.7502598701883475502@emeril.freedesktop.org>
References: <20220427184204.65427-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220427184204.65427-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsoftpin=3A_Exercise_single_offset_eviction_on_all_en?=
 =?utf-8?q?gines_=28rev3=29?=
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

--===============6791763436643749869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_softpin: Exercise single offset eviction on all engines (rev3)
URL   : https://patchwork.freedesktop.org/series/102154/
State : success

== Summary ==

CI Bug Log - changes from IGT_6458_full -> IGTPW_7017_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-skl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7017_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@evict-single-offset} (NEW):
    - shard-kbl:          NOTRUN -> ([FAIL][1], [FAIL][2])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@gem_softpin@evict-single-offset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@gem_softpin@evict-single-offset.html
    - shard-glk:          NOTRUN -> ([FAIL][3], [FAIL][4])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@gem_softpin@evict-single-offset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk1/igt@gem_softpin@evict-single-offset.html
    - shard-apl:          NOTRUN -> ([FAIL][5], [FAIL][6])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@gem_softpin@evict-single-offset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl3/igt@gem_softpin@evict-single-offset.html

  * {igt@kms_concurrent@pipe-c@hdmi-a-3} (NEW):
    - {shard-dg1}:        NOTRUN -> [CRASH][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-dg1-18/igt@kms_concurrent@pipe-c@hdmi-a-3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - {shard-rkl}:        [PASS][8] -> ([DMESG-WARN][9], [PASS][10])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_suspend@basic-s3-devices@smem:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][11] +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-dg1-19/igt@gem_exec_suspend@basic-s3-devices@smem.html

  * igt@gem_tiled_swapping@non-threaded:
    - {shard-rkl}:        NOTRUN -> ([PASS][12], [INCOMPLETE][13])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - {shard-dg1}:        NOTRUN -> ([INCOMPLETE][14], [INCOMPLETE][15]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-dg1-18/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-dg1-13/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  
New tests
---------

  New tests have been introduced between IGT_6458_full and IGTPW_7017_full:

### New IGT tests (2) ###

  * igt@gem_softpin@evict-single-offset:
    - Statuses : 6 fail(s) 6 pass(s) 2 skip(s)
    - Exec time: [0.0, 36.11] s

  * igt@kms_concurrent@pipe-c@hdmi-a-3:
    - Statuses : 1 crash(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_7017_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> ([SKIP][16], [SKIP][17]) ([i915#1839])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@feature_discovery@display-3x.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#1839])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@feature_discovery@display-3x.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> ([SKIP][19], [SKIP][20]) ([i915#1839])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@feature_discovery@display-4x.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][21] ([i915#4991])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          NOTRUN -> ([DMESG-WARN][22], [PASS][23]) ([i915#180])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#1099])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> ([SKIP][25], [SKIP][26]) ([i915#280])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_ctx_sseu@invalid-sseu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-immediate:
    - shard-tglb:         [PASS][27] -> ([TIMEOUT][28], [PASS][29]) ([i915#3063])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-tglb7/igt@gem_eio@in-flight-immediate.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@gem_eio@in-flight-immediate.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@kms:
    - shard-tglb:         NOTRUN -> ([FAIL][30], [FAIL][31]) ([i915#5784])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_eio@kms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][32] -> ([TIMEOUT][33], [TIMEOUT][34]) ([i915#3070])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][37] ([i915#2842]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][38] ([i915#2842]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> ([FAIL][39], [FAIL][40]) ([i915#2842])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> ([FAIL][41], [FAIL][42]) ([i915#2842])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][43] -> ([FAIL][44], [FAIL][45]) ([i915#2842] / [i915#2849])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-snb:          [PASS][46] -> ([PASS][47], [SKIP][48]) ([fdo#109271]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-snb4/igt@gem_exec_flush@basic-uc-set-default.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> ([SKIP][49], [SKIP][50]) ([fdo#109283])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_exec_params@no-vebox.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109283] / [i915#4877])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-apl:          [PASS][52] -> ([DMESG-WARN][53], [PASS][54]) ([i915#180]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl6/igt@gem_exec_suspend@basic-s3@smem.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@gem_exec_suspend@basic-s3@smem.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][55] -> [SKIP][56] ([i915#2190])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([fdo#109271] / [i915#4613]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@gem_lmem_swapping@parallel-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@gem_lmem_swapping@parallel-random.html
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#4613]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglb:         NOTRUN -> ([SKIP][62], [SKIP][63]) ([i915#4613]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([fdo#109271] / [i915#4613]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@gem_lmem_swapping@smem-oom.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@gem_lmem_swapping@smem-oom.html
    - shard-iclb:         NOTRUN -> ([SKIP][66], [SKIP][67]) ([i915#4613]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@gem_lmem_swapping@smem-oom.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#4613])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#4613])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][70] ([i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> ([WARN][71], [WARN][72]) ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@gem_pwrite@basic-exhaustion.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglb:         NOTRUN -> ([SKIP][73], [SKIP][74]) ([i915#4270]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-iclb:         NOTRUN -> ([SKIP][75], [SKIP][76]) ([i915#4270]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][77], [SKIP][78]) ([i915#768])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> ([SKIP][79], [SKIP][80]) ([fdo#109312])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_softpin@evict-snoop.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> ([SKIP][82], [SKIP][83]) ([i915#3297]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> ([SKIP][84], [SKIP][85]) ([i915#3297]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> ([SKIP][86], [SKIP][87]) ([fdo#109289]) +5 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          NOTRUN -> ([DMESG-WARN][88], [PASS][89]) ([i915#5566] / [i915#716])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@gen9_exec_parse@allowed-single.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([i915#2527] / [i915#2856])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gen9_exec_parse@batch-invalid-length.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([fdo#109271]) +100 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk4/igt@i915_pm_backlight@bad-brightness.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk2/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> ([WARN][94], [WARN][95]) ([i915#2681])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [WARN][96] ([i915#2684])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#111644] / [i915#1397] / [i915#2411])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> ([SKIP][98], [SKIP][99]) ([fdo#110892])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@fences:
    - shard-iclb:         [PASS][100] -> ([INCOMPLETE][101], [PASS][102]) ([i915#4185])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb4/igt@i915_pm_rpm@fences.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@i915_pm_rpm@fences.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@i915_pm_rpm@fences.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][103] ([i915#180])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#5286])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> ([SKIP][105], [SKIP][106]) ([i915#5286]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> ([SKIP][107], [SKIP][108]) ([i915#5286]) +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> ([SKIP][109], [SKIP][110]) ([fdo#110725] / [fdo#111614])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> ([SKIP][111], [SKIP][112]) ([fdo#111614]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#3777]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([fdo#109271] / [i915#3777]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#3777]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([fdo#109271] / [i915#3777]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         [PASS][119] -> ([PASS][120], [FAIL][121]) ([i915#3743])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([fdo#109271] / [i915#3777]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109271]) +144 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> ([SKIP][126], [SKIP][127]) ([fdo#110723]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-tglb:         NOTRUN -> [SKIP][128] ([fdo#111615])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> ([SKIP][129], [SKIP][130]) ([fdo#111615]) +3 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#3689]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][132], [SKIP][133]) ([i915#3689]) +9 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> ([SKIP][134], [SKIP][135]) ([fdo#109271] / [i915#3886]) +4 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][136], [SKIP][137]) ([fdo#111615] / [i915#3689]) +3 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#3886]) +3 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> ([SKIP][139], [SKIP][140]) ([fdo#109271] / [i915#3886]) +4 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk9/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> ([SKIP][141], [SKIP][142]) ([i915#3689] / [i915#3886]) +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([fdo#109271] / [i915#3886]) +7 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][145], [SKIP][146]) ([fdo#109278] / [i915#3886]) +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-snb:          NOTRUN -> ([SKIP][147], [SKIP][148]) ([fdo#109271]) +137 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][149] ([fdo#109278] / [i915#3886]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> ([SKIP][150], [SKIP][151]) ([i915#3742])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_cdclk@plane-scaling.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> ([SKIP][152], [SKIP][153]) ([i915#3742])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cdclk@plane-scaling.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> ([SKIP][154], [SKIP][155]) ([fdo#109284] / [fdo#111827]) +6 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_chamelium@dp-hpd-storm.html
    - shard-glk:          NOTRUN -> [SKIP][156] ([fdo#109271] / [fdo#111827])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk5/igt@kms_chamelium@dp-hpd-storm.html
    - shard-apl:          NOTRUN -> [SKIP][157] ([fdo#109271] / [fdo#111827])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-glk:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk4/igt@kms_chamelium@hdmi-hpd.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk9/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([fdo#109271] / [fdo#111827]) +6 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_chamelium@vga-hpd.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][162] ([fdo#109271]) +11 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk8/igt@kms_color@pipe-d-ctm-0-25.html
    - shard-iclb:         NOTRUN -> ([SKIP][163], [SKIP][164]) ([fdo#109278] / [i915#1149])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][165] ([fdo#109278] / [i915#1149])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([fdo#109271] / [fdo#111827]) +10 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_color_chamelium@pipe-a-degamma.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-kbl:          NOTRUN -> [SKIP][168] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - shard-snb:          NOTRUN -> ([SKIP][169], [SKIP][170]) ([fdo#109271] / [fdo#111827]) +4 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb7/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html
    - shard-tglb:         NOTRUN -> [SKIP][171] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> ([SKIP][172], [SKIP][173]) ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> ([SKIP][174], [SKIP][175]) ([fdo#109284] / [fdo#111827]) +10 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> ([TIMEOUT][176], [TIMEOUT][177]) ([i915#1319])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_content_protection@legacy.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][178] ([i915#1319])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl3/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> ([SKIP][179], [SKIP][180]) ([fdo#109300] / [fdo#111066]) +1 similar issue
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_content_protection@lic.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> ([SKIP][181], [SKIP][182]) ([i915#1063])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_content_protection@lic.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> ([TIMEOUT][183], [TIMEOUT][184]) ([i915#1319])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_content_protection@lic.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> ([FAIL][185], [FAIL][186]) ([i915#2105])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_content_protection@uevent.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][187] ([i915#1063]) +1 similar issue
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> ([FAIL][188], [FAIL][189]) ([i915#2105])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_content_protection@uevent.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> ([SKIP][190], [SKIP][191]) ([fdo#109278] / [fdo#109279])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][192] -> ([DMESG-WARN][193], [PASS][194]) ([i915#180]) +1 similar issue
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][195] ([i915#3359]) +1 similar issue
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> ([SKIP][196], [SKIP][197]) ([i915#3319])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> ([SKIP][198], [SKIP][199]) ([fdo#109279] / [i915#3359]) +4 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][200] ([fdo#109278] / [fdo#109279])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> ([SKIP][201], [SKIP][202]) ([i915#3359]) +6 similar issues
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html
    - shard-iclb:         NOTRUN -> [SKIP][203] ([fdo#109278]) +2 similar issues
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][204] ([fdo#109279] / [i915#3359]) +1 similar issue
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-iclb:         NOTRUN -> ([SKIP][205], [SKIP][206]) ([fdo#109274] / [fdo#109278])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         [PASS][207] -> ([PASS][208], [FAIL][209]) ([i915#2346])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglb:         NOTRUN -> ([SKIP][210], [SKIP][211]) ([i915#4103])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> ([SKIP][212], [SKIP][213]) ([i915#3528])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> ([SKIP][214], [SKIP][215]) ([i915#3528])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][216], [SKIP][217]) ([i915#5287]) +1 similar issue
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html
    - shard-tglb:         NOTRUN -> ([SKIP][218], [SKIP][219]) ([i915#5287])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][220] ([i915#5287])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> ([PASS][221], [INCOMPLETE][222]) ([i915#180])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk:          NOTRUN -> ([FAIL][223], [FAIL][224]) ([i915#4767])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][225] ([i915#180])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][226] ([fdo#109274])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> ([SKIP][227], [SKIP][228]) ([fdo#109274]) +3 similar issues
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglb:         NOTRUN -> ([SKIP][229], [SKIP][230]) ([fdo#109274] / [fdo#111825]) +5 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-tglb:         [PASS][231] -> [DMESG-WARN][232] ([i915#2411])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-iclb:         [PASS][233] -> ([DMESG-WARN][234], [PASS][235]) ([i915#2867])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][236] -> ([PASS][237], [SKIP][238]) ([i915#3701])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> ([SKIP][239], [SKIP][240]) ([fdo#109285])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_force_connector_basic@force-load-detect.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][241] ([fdo#109280] / [fdo#111825]) +7 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][242] -> [DMESG-WARN][243] ([i915#180])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][244] ([fdo#109280])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> ([SKIP][245], [SKIP][246]) ([fdo#109280]) +26 similar issues
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-apl:          NOTRUN -> [SKIP][247] ([fdo#109271]) +42 similar issues
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> ([SKIP][248], [SKIP][249]) ([fdo#109280] / [fdo#111825]) +34 similar issues
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> ([SKIP][250], [SKIP][251]) ([i915#3555]) +1 similar issue
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-iclb:         NOTRUN -> ([SKIP][252], [SKIP][253]) ([fdo#109289]) +3 similar issues
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][254] ([fdo#109289]) +1 similar issue
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> ([SKIP][255], [SKIP][256]) ([fdo#109271] / [i915#533])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> ([SKIP][257], [SKIP][258]) ([fdo#109271] / [i915#533])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> ([SKIP][259], [SKIP][260]) ([fdo#109271] / [i915#533])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> ([FAIL][261], [FAIL][262]) ([i915#265])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> ([FAIL][263], [FAIL][264]) ([i915#265])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> ([FAIL][265], [FAIL][266]) ([fdo#108145] / [i915#265]) +2 similar issues
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          NOTRUN -> ([FAIL][267], [FAIL][268]) ([fdo#108145] / [i915#265])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-tglb:         NOTRUN -> ([SKIP][269], [SKIP][270]) ([i915#3536]) +1 similar issue
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_plane_lowres@pipe-d-tiling-4:
    - shard-tglb:         NOTRUN -> ([SKIP][271], [SKIP][272]) ([i915#5288])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-4.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][273] ([i915#3536])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-none.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-kbl:          NOTRUN -> [SKIP][274] ([fdo#109271]) +129 similar issues
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation:
    - shard-kbl:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([fdo#109271]) +144 similar issues
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation:
    - shard-iclb:         NOTRUN -> ([SKIP][277], [SKIP][278]) ([i915#5176]) +2 similar issues
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> ([SKIP][279], [SKIP][280]) ([i915#5176]) +7 similar issues
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - shard-iclb:         NOTRUN -> ([SKIP][281], [SKIP][282]) ([i915#5235]) +2 similar issues
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> ([SKIP][283], [SKIP][284]) ([i915#5235]) +7 similar issues
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][285] -> ([PASS][286], [SKIP][287]) ([i915#5176])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format:
    - shard-iclb:         [PASS][288] -> ([INCOMPLETE][289], [PASS][290]) ([i915#5395])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb5/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-tglb:         NOTRUN -> ([SKIP][291], [SKIP][292]) ([i915#2920])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
    - shard-iclb:         NOTRUN -> ([SKIP][293], [SKIP][294]) ([i915#658])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-apl:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([fdo#109271] / [i915#658]) +1 similar issue
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl3/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-kbl:          NOTRUN -> [SKIP][297] ([fdo#109271] / [i915#658]) +1 similar issue
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-glk:          NOTRUN -> ([SKIP][298], [SKIP][299]) ([fdo#109271] / [i915#658])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@kms_psr2_su@page_flip-p010.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_psr2_su@page_flip-p010.html
    - shard-iclb:         NOTRUN -> ([SKIP][300], [SKIP][301]) ([fdo#109642] / [fdo#111068] / [i915#658])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_psr2_su@page_flip-p010.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][302] ([i915#132] / [i915#3467])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_dpms:
    - shard-tglb:         NOTRUN -> ([FAIL][303], [FAIL][304]) ([i915#132] / [i915#3467]) +2 similar issues
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_psr@psr2_dpms.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_psr@psr2_dpms.html
    - shard-iclb:         NOTRUN -> ([PASS][305], [SKIP][306]) ([fdo#109441]) +1 similar issue
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][307] -> ([SKIP][308], [SKIP][309]) ([fdo#109441]) +1 similar issue
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         NOTRUN -> ([SKIP][310], [SKIP][311]) ([fdo#109441])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_psr@psr2_primary_blt.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][312] -> ([SKIP][313], [PASS][314]) ([i915#5519])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][315] ([i915#5289])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-iclb:         NOTRUN -> ([SKIP][316], [SKIP][317]) ([i915#5289])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> ([SKIP][318], [SKIP][319]) ([fdo#109278]) +33 similar issues
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][320] ([fdo#109271] / [i915#533])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-iclb:         NOTRUN -> ([SKIP][321], [SKIP][322]) ([i915#3555])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_vrr@flip-basic.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([fdo#109271] / [i915#2437])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_writeback@writeback-pixel-formats.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][325] ([i915#2530])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> ([SKIP][326], [SKIP][327]) ([i915#2530]) +1 similar issue
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@nouveau_crc@pipe-c-source-rg.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-snb:          NOTRUN -> [SKIP][328] ([fdo#109271]) +20 similar issues
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb6/igt@nouveau_crc@pipe-d-source-rg.html
    - shard-tglb:         NOTRUN -> ([SKIP][329], [SKIP][330]) ([i915#2530]) +2 similar issues
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@nouveau_crc@pipe-d-source-rg.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@nouveau_crc@pipe-d-source-rg.html
    - shard-iclb:         NOTRUN -> ([SKIP][331], [SKIP][332]) ([fdo#109278] / [i915#2530])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@nouveau_crc@pipe-d-source-rg.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-iclb:         NOTRUN -> ([PASS][333], [INCOMPLETE][334]) ([i915#5712])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@prime_mmap_coherency@ioctl-errors.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-iclb:         NOTRUN -> ([SKIP][335], [SKIP][336]) ([fdo#109291]) +1 similar issue
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@prime_nv_api@i915_nv_double_export.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][337] ([fdo#109291]) +1 similar issue
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> ([SKIP][338], [SKIP][339]) ([fdo#109291]) +2 similar issues
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> ([SKIP][340], [SKIP][341]) ([fdo#111656])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@prime_vgem@coherency-gtt.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@prime_vgem@coherency-gtt.html
    - shard-iclb:         NOTRUN -> ([SKIP][342], [SKIP][343]) ([fdo#109292])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@prime_vgem@coherency-gtt.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@prime_vgem@coherency-gtt.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-iclb:         NOTRUN -> ([DMESG-FAIL][344], [DMESG-FAIL][345]) ([i915#5098])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@syncobj_timeline@transfer-timeline-point.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-kbl:          NOTRUN -> ([DMESG-FAIL][346], [DMESG-FAIL][347]) ([i915#5098])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@syncobj_timeline@transfer-timeline-point.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-tglb:         NOTRUN -> ([DMESG-FAIL][348], [DMESG-FAIL][349]) ([i915#5098])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@syncobj_timeline@transfer-timeline-point.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][350] ([i915#2994]) +1 similar issue
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> ([SKIP][351], [SKIP][352]) ([fdo#109271] / [i915#2994]) +2 similar issues
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@sysfs_clients@fair-3.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@sysfs_clients@fair-3.html
    - shard-tglb:         NOTRUN -> ([SKIP][353], [SKIP][354]) ([i915#2994]) +2 similar issues
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@sysfs_clients@fair-3.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@sysfs_clients@fair-3.html
    - shard-iclb:         NOTRUN -> ([SKIP][355], [SKIP][356]) ([i915#2994]) +2 similar issues
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@sysfs_clients@fair-3.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> ([SKIP][357], [SKIP][358]) ([fdo#109271] / [i915#2994]) +3 similar issues
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@sysfs_clients@recycle-many.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> ([SKIP][359], [SKIP][360]) ([fdo#109271] / [i915#2994]) +2 similar issues
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@sysfs_clients@recycle-many.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10:
    - shard-kbl:          NOTRUN -> [SKIP][361] ([fdo#109271] / [i915#2994]) +3 similar issues
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@sysfs_clients@sema-10.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> ([SKIP][362], [SKIP][363]) ([fdo#109307])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@tools_test@sysfs_l3_parity.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@tools_test@sysfs_l3_parity.html
    - shard-tglb:         NOTRUN -> ([SKIP][364], [SKIP][365]) ([fdo#109307])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@tools_test@sysfs_l3_parity.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_create@madvise@smem:
    - {shard-rkl}:        [INCOMPLETE][366] ([i915#5385]) -> ([PASS][367], [PASS][368])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-rkl-5/igt@gem_exec_create@madvise@smem.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-6/igt@gem_exec_create@madvise@smem.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-5/igt@gem_exec_create@madvise@smem.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][369] ([i915#2842]) -> ([PASS][370], [PASS][371])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][372] ([i915#4281]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-1/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_color@pipe-c-invalid-degamma-lut-sizes:
    - {shard-rkl}:        [SKIP][374] ([i915#4070]) -> ([PASS][375], [PASS][376])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-rkl-1/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-4/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-5/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][377] -> ([PASS][378], [PASS][379])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][380] ([i915#2346] / [i915#533]) -> ([PASS][381], [PASS][382])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-snb:          [DMESG-WARN][383] ([i915#5090]) -> ([PASS][384], [PASS][385])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-iclb:         [INCOMPLETE][386] -> ([PASS][387], [PASS][388])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb7/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][389] ([i915#180]) -> [PASS][390] +1 similar issue
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [SKIP][391] ([i915#3701]) -> ([PASS][392], [PASS][393])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:
    - shard-apl:          [DMESG-WARN][394] ([i915#180]) -> ([PASS][395], [PASS][396]) +1 similar issue
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl6/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format:
    - shard-iclb:         [SKIP][397] ([i915#5176]) -> ([PASS][398], [PASS][399]) +2 similar issues
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-glk:          [DMESG-FAIL][400] ([i915#118] / [i915#1888]) -> ([PASS][401], [PASS][402])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-glk5/igt@kms_rotation_crc@primary-rotation-180.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@kms_rotation_crc@primary-rotation-180.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@perf_pmu@rc6-suspend:
    - shard-kbl:          [DMESG-WARN][403] ([i915#180]) -> [PASS][404] +1 similar issue
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@perf_pmu@rc6-suspend.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][405] ([i915#4525]) -> ([SKIP][406], [DMESG-WARN][407]) ([i915#4525] / [i915#5614])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [DMESG-WARN][408] ([i915#5614]) -> ([SKIP][409], [SKIP][410]) ([i915#4525]) +1 similar issue
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][411] ([i915#4525]) -> ([DMESG-FAIL][412], [SKIP][413]) ([i915#4525] / [i915#5614])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [DMESG-WARN][414] ([i915#5614]) -> ([DMESG-WARN][415], [SKIP][416]) ([i915#4525] / [i915#5614])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][417] ([i915#2846]) -> ([FAIL][418], [PASS][419]) ([i915#2846])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][420] ([i915#2842]) -> ([PASS][421], [FAIL][422]) ([i915#2842])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][423] ([i915#2842]) -> ([PASS][424], [FAIL][425]) ([i915#2842]) +1 similar issue
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          [SKIP][426] ([fdo#109271] / [i915#3777]) -> [SKIP][427] ([fdo#109271])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [INCOMPLETE][428] ([i915#5243]) -> ([PASS][429], [SKIP][430]) ([i915#5176])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][431] ([i915#2920]) -> ([SKIP][432], [SKIP][433]) ([i915#658])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][434] ([fdo#111068] / [i915#658]) -> ([SKIP][435], [SKIP][436]) ([fdo#111068] / [i915#2920] / [i915#658])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][437] ([fdo#109441]) -> ([SKIP][438], [PASS][439]) ([fdo#109441]) +5 similar issues
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][440], [FAIL][441], [FAIL][442], [FAIL][443], [FAIL][444], [FAIL][445], [FAIL][446], [FAIL][447], [FAIL][448], [FAIL][449], [FAIL][450]) ([i915#4312] / [i915#5257]) -> ([FAIL][451], [FAIL][452], [FAIL][453], [FAIL][454], [FAIL][455], [FAIL][456], [FAIL][457], [FAIL][458], [FAIL][459], [FAIL][460], [FAIL][461], [FAIL][462], [FAIL][463], [FAIL][464], [FAIL][465], [FAIL][466], [FAIL][467], [FAIL][468], [FAIL][469], [FAIL][470], [FAIL][471]) ([fdo#109271] / [i915#180] / [i915#4312] / [i915#5257] / [i915#716] / [i915#92])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl1/igt@runner@aborted.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl4/igt@runner@aborted.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl3/igt@runner@aborted.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl6/igt@runner@aborted.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl6/igt@runner@aborted.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl6/igt@runner@aborted.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@runner@aborted.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@runner@aborted.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@runner@aborted.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@runner@aborted.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@runner@aborted.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@runner@aborted.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@runner@aborted.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][472], [FAIL][473], [FAIL][474], [FAIL][475], [FAIL][476], [FAIL][477], [FAIL][478], [FAIL][479]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][480], [FAIL][481], [FAIL][482], [FAIL][483], [FAIL][484], [FAIL][485], [FAIL][486], [FAIL][487], [FAIL][488], [FAIL][489], [FAIL][490], [FAIL][491]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl4/igt@runner@aborted.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl3/igt@runner@aborted.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl6/igt@runner@aborted.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl8/igt@runner@aborted.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl7/igt@runner@aborted.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl4/igt@runner@aborted.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl6/igt@runner@aborted.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl8/igt@runner@aborted.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@runner@aborted.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@runner@aborted.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl6/igt@runner@aborted.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@runner@aborted.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@runner@aborted.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@runner@aborted.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl3/igt@runner@aborted.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@runner@aborted.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@runner@aborted.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@runner@aborted.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@runner@aborted.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4185]: https://gitlab.freedesktop.org/drm/intel/issues/4185
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitla

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/index.html

--===============6791763436643749869==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/i915/gem_softpin: Exercise single offs=
et eviction on all engines (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102154/">https://patchwork.freedesktop.org/series/102154/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6458_full -&gt; IGTPW_7017_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/index.=
html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): shard-skl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7017=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-single-offset} (NEW):</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-kbl6/igt@gem_softpin@evict-single-offset.html">FAIL</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk6/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-glk1/igt@gem_softpin@evict-single-offset.html">FAIL</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl8/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-apl3/igt@gem_softpin@evict-single-offset.html">FAIL</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_concurrent@pipe-c@hdmi-a-3} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-dg1-18/igt@kms_concurrent@pipe-c@hdmi-a-3.ht=
ml">CRASH</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7017/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_701=
7/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">PASS</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-dg1-19/igt@gem_exec_suspend@basic-s3-devices=
@smem.html">INCOMPLETE</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html">INCOMPLETE</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-dg1-18/igt@kms_cursor_crc@pipe-b-cursor-sus=
pend.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-dg1-13/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">=
INCOMPLETE</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6458_full and IGTPW_7017_full=
:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>Statuses : 6 fail(s) 6 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 36.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c@hdmi-a-3:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7017_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@feature_discovery@display-3x.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-iclb8/igt@feature_discovery@display-3x.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb7/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@feature_discovery@display-4x.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/=
shard-tglb5/igt@feature_discovery@display-4x.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_create@create-massive.html">DM=
ESG-WARN</a> ([i915#4991])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@=
rcs0.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-snb5/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-tglb5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-tglb7/igt@gem_eio@in-flight-immediate.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2=
/igt@gem_eio@in-flight-immediate.html">TIMEOUT</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@gem_eio@in-flight-i=
mmediate.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@gem_eio@kms.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@g=
em_eio@kms.html">FAIL</a>) ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@=
gem_eio@unwedge-stress.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_eio@unwedge-stress.html">=
TIMEOUT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/30=
70">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-iclb8/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href=3D"=
https://gitla">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@gem_exec_fair@basic-none@vcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7017/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a=
>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_exec_f=
air@basic-throttle@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2842">i915#2842</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-snb4/igt@gem_exec_flush@basic-uc-set-default.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-snb5/igt@gem_exec_flush@basic-uc-set-default.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-snb6/igt@gem_exec_=
flush@basic-uc-set-default.html">SKIP</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_exec_params@no-vebox.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-iclb4/igt@gem_exec_params@no-vebox.html">SKIP</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109283">fdo#109283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a> / [i915#4877])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-apl6/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl=
4/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl1/igt@gem_exec_susp=
end@basic-s3@smem.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@ge=
m_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl1/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-apl6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a>) (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ [i915#4613]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-kbl1/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk6/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-glk1/igt@gem_lmem_swapping@parallel-random-verify-ccs.h=
tml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_lmem_swapping@parallel-random-=
verify-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify-ccs=
.html">SKIP</a>) ([i915#4613]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@gem_lmem_swapping@smem-oom.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-kbl1/igt@gem_lmem_swapping@smem-oom.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#4613])=
 +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@gem_lmem_swapping@smem-oom.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb7/igt@gem_lmem_swapping@smem-oom.html">SKIP</a>) ([i915#4613]) +1 si=
milar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i9=
15#2658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl6/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-apl8/igt@gem_pwrite@basic-exhaustion.html">WARN</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@gem_pxp@verify-pxp-execution-afte=
r-suspend-resume.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7017/shard-tglb2/igt@gem_pxp@verify-pxp-execution-after-sus=
pend-resume.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4270">i915#4270</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@gem_pxp@verify-pxp-stale-buf-opto=
ut-execution.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-optout-execut=
ion.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to=
-vebox-y-tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-=
y-tiled.html">SKIP</a>) ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gem_softpin@evict-snoop.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-tglb8/igt@gem_softpin@evict-snoop.html">SKIP</a>) (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109312">fdo#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_userptr_blits@access-control.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7017/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3=
297</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7017/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3=
297</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7017/shard-tglb1/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a>) (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</=
a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@gen9_exec_parse@allowed-single.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7017/shard-kbl6/igt@gen9_exec_parse@allowed-single.html">PASS</a>) ([i915=
#5566] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@gen9_exec_parse@batch-invalid-len=
gth.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7017/shard-tglb8/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#25=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i=
915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-glk4/igt@i915_pm_backlight@bad-brightness.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-glk2/igt@i915_pm_backlight@bad-brightness.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+100 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684=
">i915#2684</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7017/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>)=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110=
892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb4/igt@i915_pm_rpm@fences.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@i91=
5_pm_rpm@fences.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@i915_pm_rpm@fences.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4185">i915#41=
85</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@i915_suspend@debugfs-reader.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_big_fb@4-tiled-16bpp-rotate-27=
0.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-27=
0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7017/shard-iclb5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a>) ([=
i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_big_fb@4-tiled-max-=
hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) ([i915#5286]) +4 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725">fdo#110725</a=
> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111614">fdo#1=
11614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-90.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111614">fdo#111614</a=
>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3777">i915#3777</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_big_fb@x-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_big_fb@x-tiled-max-=
hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180=
-hflip-async-flip.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_big_fb@y-tiled-=
max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3777">i915#3777</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7017/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-0.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>) +144 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-=
rotate-0.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110723">fdo#110723</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-y=
_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3689">i915#3689</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf=
_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-tglb7/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk9/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_ti=
led_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_ti=
led_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_ccs@pipe-b-crc-primary-rotati=
on-180-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-=
rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-snb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-snb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +137 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_cdclk@plane-scaling.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-=
iclb2/igt@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cdclk@plane-scaling.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-=
tglb5/igt@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb2/igt@kms_chamelium@dp-hpd-storm.html">SKIP</a>) (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +6 =
similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-glk5/igt@kms_chamelium@dp-hpd-storm.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-apl1/igt@kms_chamelium@dp-hpd-storm.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-glk4/igt@kms_chamelium@hdmi-hpd.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-g=
lk9/igt@kms_chamelium@hdmi-hpd.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_chamelium@vga-hpd.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-ap=
l7/igt@kms_chamelium@vga-hpd.html">SKIP</a>) (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-glk8/igt@kms_color@pipe-d-ctm-0-25.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) +11 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-iclb2/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_color_chamelium@pipe-a-degamma=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7017/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a>) (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#=
111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-snb7/igt@kms_color_chamelium@pipe-c-ctm-gree=
n-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.htm=
l">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_color_chamelium@pipe-c-ctm-gree=
n-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-bl=
ue-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-gr=
een-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-apl6/igt@kms_content_protection@legacy.html=
">TIMEOUT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-apl8/igt@kms_content_protection@legacy.html">TIMEOUT</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-apl3/igt@kms_content_protection@lic.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_content_protection@lic.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb5/igt@kms_content_protection@lic.html">SKIP</a>) (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109300</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066">fdo#111066</a>) +1 =
similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_content_protection@lic.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-tglb2/igt@kms_content_protection@lic.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1063">i915#1063</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_content_protection@lic.html">TI=
MEOUT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-kbl6/igt@kms_content_protection@lic.html">TIMEOUT</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_content_protection@uevent.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-kbl6/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_content_protection@uevent.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-apl8/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x=
512-random.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@k=
ms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x3=
2-random.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/331=
9">i915#3319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x=
170-onscreen.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscr=
een.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3359">i915#3359</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-rapid-movement.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-=
rapid-movement.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-512x17=
0-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flip=
a-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-varyi=
ng-size.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/ig=
t@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_cursor_legacy@sho=
rt-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb21010=
10-mmap-wc-4tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-=
mmap-wc-4tiled.html">SKIP</a>) ([i915#5287]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb21010=
10-mmap-wc-4tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7017/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-=
mmap-wc-4tiled.html">SKIP</a>) ([i915#5287])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-=
mmap-wc-4tiled.html">SKIP</a> ([i915#5287])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-glk3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a>) ([i915#4767])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_flip@2x-flip-vs-blocking-wf-vb=
lank.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb-interrup=
tible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7017/shard-iclb8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP=
</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fd=
o#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/shard-tglb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111825">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7017/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7017/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i9=
15#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yti=
le-downscaling.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytile-downscaling.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_flip_scaled_crc@flip-=
64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@kms_force_connector_basic@force-l=
oad-detect.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-tglb6/igt@kms_force_connector_basic@force-load-detect.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +26=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_frontbuffer_trackin=
g@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) =
+34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sh=
ard-tglb2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_pipe_b_c_ivb@disable-pipe-b-e=
nable-pipe-c.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pip=
e-c.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109289">fdo#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-=
with-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitychec=
k-pipe-d.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk8/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-glk6/igt@kms_pipe_crc_basic@compare-crc-sanitychec=
k-pipe-d.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-kbl3/igt@kms_pipe_crc_basic@compare-crc-sanitychec=
k-pipe-d.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-transp=
arent-fb.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7017/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transp=
arent-fb.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.h=
tml">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
08145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/265">i915#265</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.h=
tml">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
08145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_plane_lowres@pipe-c-tiling-x.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-x.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/3536">i915#3536</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-4.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-4.html">SKIP</a>) ([i915=
#5288])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-x:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-ti=
ling-x.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +129 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-dow=
nscale-with-rotation:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@kms_plane_scaling@downscale-with-r=
otation-factor-0-5@pipe-a-dp-1-downscale-with-rotation.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@k=
ms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-w=
ith-rotation.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +144 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-do=
wnscale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_plane_scaling@downscale-with-=
rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/ig=
t@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downsca=
le-with-rotation.html">SKIP</a>) ([i915#5176]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-do=
wnscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_plane_scaling@downscale-with-=
rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/ig=
t@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downsca=
le-with-rotation.html">SKIP</a>) ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_plane_scaling@planes-upscale-=
20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pip=
e-a-edp-1-planes-upscale-downscale.html">SKIP</a>) ([i915#5235]) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb6/igt@kms_plane_scaling@planes-upscale-=
factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-tglb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-25@pipe-a-edp-1-planes-upscale-downscale.html">SKIP</a>) ([i915#5235]=
) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-=
with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@p=
ipe-a-edp-1-scaler-with-clipping-clamping.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb4/igt@kms_pla=
ne_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-=
clamping.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clampin=
g@pipe-a-edp-1-scaler-with-clipping-clamping.html">SKIP</a>) ([i915#5176])<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-=
1-scaler-with-pixel-format:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb5/igt@kms_plane_scaling@scaler-with-pixel-format-unity-=
scaling@pipe-b-edp-1-scaler-with-pixel-format.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms=
_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-w=
ith-pixel-format.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_plane_scaling@scaler-with-pi=
xel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html">PASS</=
a>) ([i915#5395])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@kms_psr2_sf@cursor-plane-move-cont=
inuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-tglb6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-cont=
inuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a>) ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl2/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-apl3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
> / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk6/igt@kms_psr2_su@page_flip-p010.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-glk3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#658])<=
/p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_psr2_su@page_flip-p010.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / [i=
915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_psr@psr2_dpms.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/=
igt@kms_psr@psr2_dpms.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/132">i915#132</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3467">i915#3467</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb6/=
igt@kms_psr@psr2_dpms.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@km=
s_psr@psr2_no_drrs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_psr@psr2_no_drrs.html">SKIP</a>)=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_psr@psr2_primary_blt.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-iclb5/igt@kms_psr@psr2_primary_blt.html">SKIP</a>) (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7017/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">PASS</a>) ([i915#5519])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-tglb5/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> ([i915#5289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-iclb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x=
-180.html">SKIP</a>) ([i915#5289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation=
-idle-hang.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7017/shard-iclb7/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@kms_vrr@flip-basic.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb=
7/igt@kms_vrr@flip-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_writeback@writeback-pixel-form=
ats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7017/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>=
) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@nouveau_crc@pipe-a-source-outp-com=
plete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@nouveau_crc@pipe-c-source-rg.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/=
shard-iclb4/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-snb6/igt@nouveau_crc@pipe-d-source-rg.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +20 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb1/igt@nouveau_crc@pipe-d-source-rg.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-tglb6/igt@nouveau_crc@pipe-d-source-rg.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>) +2 simila=
r issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@nouveau_crc@pipe-d-source-rg.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-iclb2/igt@nouveau_crc@pipe-d-source-rg.html">SKIP</a>) (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_coherency@ioctl-errors:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@prime_mmap_coherency@ioctl-errors=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7017/shard-iclb4/igt@prime_mmap_coherency@ioctl-errors.html">INCOMPLETE</a>=
) ([i915#5712])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@prime_nv_api@i915_nv_double_expor=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7017/shard-iclb4/igt@prime_nv_api@i915_nv_double_export.html">SKIP</a>) (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@prime_nv_api@i915_nv_import_vs_clo=
se.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-tglb2/igt@prime_nv_test@nv_write_i915_cpu_m=
map_read.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7017/shard-tglb3/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
91">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb3/igt@prime_vgem@coherency-gtt.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-tglb2/igt@prime_vgem@coherency-gtt.html">SKIP</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111656">fdo#111656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@prime_vgem@coherency-gtt.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-iclb8/igt@prime_vgem@coherency-gtt.html">SKIP</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109292">fdo#109292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@syncobj_timeline@transfer-timeline=
-point.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-iclb2/igt@syncobj_timeline@transfer-timeline-point.h=
tml">DMESG-FAIL</a>) ([i915#5098])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@syncobj_timeline@transfer-timeline-=
point.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7017/shard-kbl6/igt@syncobj_timeline@transfer-timeline-point.htm=
l">DMESG-FAIL</a>) ([i915#5098])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@syncobj_timeline@transfer-timeline=
-point.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-tglb5/igt@syncobj_timeline@transfer-timeline-point.h=
tml">DMESG-FAIL</a>) ([i915#5098])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@sysfs_clients@busy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@sysfs_clients@fair-3.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl1=
/igt@sysfs_clients@fair-3.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +2 similar issues</=
p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@sysfs_clients@fair-3.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tgl=
b2/igt@sysfs_clients@fair-3.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2994">i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@sysfs_clients@fair-3.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-icl=
b4/igt@sysfs_clients@fair-3.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2994">i915#2994</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-apl4/igt@sysfs_clients@recycle-many.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-apl1/igt@sysfs_clients@recycle-many.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +3 simi=
lar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-glk3/igt@sysfs_clients@recycle-many.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-glk6/igt@sysfs_clients@recycle-many.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +2 simi=
lar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@sysfs_clients@sema-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb4/igt@tools_test@sysfs_l3_parity.html">SKIP</a>) (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109307">fdo#109307</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7017/shard-tglb5/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-tglb2/igt@tools_test@sysfs_l3_parity.html">SKIP</a>) (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109307">fdo#109307</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@madvise@smem:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-rkl-5/igt@gem_exec_create@madvise@smem.html">INCOMPLETE</a>=
 ([i915#5385]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7017/shard-rkl-6/igt@gem_exec_create@madvise@smem.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-5/igt@=
gem_exec_create@madvise@smem.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb7/igt@gem_exec_fai=
r@basic-flow@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-rkl-1/ig=
t@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-degamma-lut-sizes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-rkl-1/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">=
i915#4070</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7017/shard-rkl-4/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sh=
ard-rkl-5/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html">PASS</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s.html">FAIL</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7017/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7017/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.=
html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2346">i915#2346</a> / [i915#533]) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk6/igt@kms_cursor_legac=
y@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk3/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html=
">DMESG-WARN</a> ([i915#5090]) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-snb4/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-vga1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7017/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga=
1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb7/igt@kms_flip@flip-vs-suspend@a-edp1.html">INCOMPLETE<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-iclb4/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb8/igt@kms_flip=
@flip-vs-suspend@a-edp1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/=
shard-apl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3701">i915#3701</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_flip_scaled_crc@flip-=
32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@kms_flip_scal=
ed_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-apl6/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1=
-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/180">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7017/shard-apl4/igt@kms_hdr@bpc-switch-suspend@bpc-s=
witch-suspend-dp-1-pipe-a.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@kms_hdr@bpc-switch-suspend@bpc=
-switch-suspend-dp-1-pipe-a.html">PASS</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-=
1-downscale-with-pixel-format:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-fac=
tor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">SKIP</a> ([i915#5176=
]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sh=
ard-iclb4/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe=
-c-edp-1-downscale-with-pixel-format.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb5/igt@kms_plane_scaling@=
downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-fo=
rmat.html">PASS</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-glk5/igt@kms_rotation_crc@primary-rotation-180.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
88">i915#1888</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7017/shard-glk6/igt@kms_rotation_crc@primary-rotation-180.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-glk3/igt@kms_rotation_crc@primary-rotation-180.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-kbl7/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3=
/igt@perf_pmu@rc6-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a=
> (<a href=3D"https://gitla">i915#4525</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@gem_exec_balancer@pa=
rallel-bb-first.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7017/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.htm=
l">DMESG-WARN</a>) (<a href=3D"https://gitla">i915#4525</a> / [i915#5614])<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">DMESG-WARN</a> ([i915#5614]) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb7/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fenc=
e.html">SKIP</a>) (<a href=3D"https://gitla">i915#4525</a>) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitla">i915#4525</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb1/igt@gem_exec_balancer@pa=
rallel-ordering.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7017/shard-iclb6/igt@gem_exec_balancer@parallel-orderi=
ng.html">SKIP</a>) (<a href=3D"https://gitla">i915#4525</a> / [i915#5614])<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-=
WARN</a> ([i915#5614]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7017/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html=
">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7017/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a>) =
(<a href=3D"https://gitla">i915#4525</a> / [i915#5614])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard=
-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-glk2/igt@gem_exec_fair@bas=
ic-deadline.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017=
/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/igt@gem_=
exec_fair@basic-none-solo@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#28=
42</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-tglb8/igt@=
gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3777">i915#3777</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/igt@kms_big_fb@y-tiled-m=
ax-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-=
with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@p=
ipe-b-edp-1-scaler-with-clipping-clamping.html">INCOMPLETE</a> ([i915#5243]=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-s=
caler-with-clipping-clamping.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7017/shard-iclb3/igt@kms_plane_scaling@scaler-w=
ith-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">SKIP=
</a>) ([i915#5176])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7017/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_701=
7/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</=
a>) ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / [i915#658]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a>) (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a=
> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/s=
hard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-iclb2/igt@kms_psr@ps=
r2_primary_mmap_cpu.html">PASS</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109441">fdo#109441</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/s=
hard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6458/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6458/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/=
shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6458/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4=
312</a> / [i915#5257]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7017/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7017/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
017/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/sha=
rd-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7017/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl6/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7017/shard-kbl4/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-kbl3/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7017/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i91=
5#4312</a> / [i915#5257] / [i915#716] / [i915#92])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6458/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/s=
hard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6458/shard-apl8/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6458/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6458/shard-apl6/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6458/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a> / [i915#5257]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7017/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7017/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
17/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shar=
d-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7017/shard-apl8/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7017/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/shard-apl2/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7017/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / [i915#5257])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============6791763436643749869==--
