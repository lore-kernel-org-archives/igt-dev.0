Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8340230758691257653=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Sat, 25 Nov 2023 07:32:31 -0000
Message-ID: <170089755134.14415.17922828531385084268@emeril.freedesktop.org>
References: <20231123113228.30729-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231123113228.30729-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/kms=5Ffrontbuffer=5Ftracking=3A_Add_new_subtest_to_test_F?=
 =?utf-8?q?BC_on_each_pipe_=28rev2=29?=
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

--===============8340230758691257653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each pipe (rev2)
URL   : https://patchwork.freedesktop.org/series/126708/
State : success

== Summary ==

CI Bug Log - changes from IGT_7598_full -> IGTPW_10254_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_10254_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10254_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10254_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_frontbuffer_tracking@pipe-fbc-rte} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  
#### Warnings ####

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][4] ([i915#8898]) -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-snb2/igt@gem_eio@reset-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb4/igt@gem_eio@reset-stress.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:
    - shard-tglu:         [FAIL][6] ([i915#3591]) -> [WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  
New tests
---------

  New tests have been introduced between IGT_7598_full and IGTPW_10254_full:

### New IGT tests (3) ###

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10254_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#7701])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +31 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@drm_fdinfo@busy@ccs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#3555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([fdo#109314])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#280]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][18] ([i915#5784])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#6334]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#6334])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-glk:          NOTRUN -> [FAIL][22] ([i915#9606])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk9/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_endless@dispatch@ccs1:
    - shard-dg2:          NOTRUN -> [TIMEOUT][23] ([i915#7016])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_exec_endless@dispatch@ccs1.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#3539] / [i915#4852]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][25] ([i915#2842]) +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#4473] / [i915#4771])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [PASS][27] -> [FAIL][28] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3539])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3539])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4812])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4812])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([fdo#112283]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([fdo#112283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3281]) +11 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#3281]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3281]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4860]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4860])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4860]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#4613])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-9/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4565])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@random:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4613])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#4613]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3282])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#8289])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4083]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4077])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077]) +18 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@gem_mmap_wc@close.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3282]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4270])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4270])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4270]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_readwrite@read-write:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3282])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@gem_readwrite@read-write.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4079]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4879])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3297]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3297])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3297] / [i915#4958])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [FAIL][63] ([i915#3318])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk3/igt@gem_userptr_blits@vma-merge.html
    - shard-dg2:          NOTRUN -> [FAIL][64] ([i915#3318])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_mixed_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([fdo#109289])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([fdo#109289]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][67] -> [INCOMPLETE][68] ([i915#5566])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#2856]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#2856])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([fdo#109293] / [fdo#109506])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][72] -> [INCOMPLETE][73] ([i915#7790])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-snb5/igt@i915_pm_rps@reset.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#8925])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([fdo#109302])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4215])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4212])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4212] / [i915#5608])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#1769])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4538] / [i915#5286])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([fdo#111615] / [i915#5286])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#5286])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([fdo#111614]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([fdo#111614]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][85] -> [FAIL][86] ([i915#3743]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#5190]) +11 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4538] / [i915#5190]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([fdo#111615])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([fdo#111615]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4538]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#2705])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#2705])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4087] / [i915#7213]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4087]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([fdo#111827])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([fdo#111827])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#7828]) +9 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#7828]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#7828])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#7828]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3555]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][103] ([i915#7173])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3299])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3299])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#7118]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#7116])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#7118] / [i915#7162])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#3359])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][110] ([fdo#109271]) +104 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3359]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4103] / [i915#4213] / [i915#5608])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3546])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([fdo#109274] / [i915#5354]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([fdo#109274])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][117] -> [FAIL][118] ([i915#2346])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][119] ([i915#2346])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-mtlp:         [PASS][120] -> [DMESG-WARN][121] ([i915#2017])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4103] / [i915#4213])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4103] / [i915#4213])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#3555] / [i915#3840] / [i915#4098])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#3840] / [i915#9688])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#3555] / [i915#3840] / [i915#4098])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#3469])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([fdo#109274]) +9 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([fdo#109274] / [fdo#111767])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#8381])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-snb:          NOTRUN -> [SKIP][132] ([fdo#109271]) +9 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#3637])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([fdo#111767] / [i915#3637])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([fdo#109274] / [i915#3637])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-10/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a4:
    - shard-dg1:          [PASS][136] -> [DMESG-WARN][137] ([i915#4423])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-16/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-14/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#2672])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#2587] / [i915#2672])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#2587] / [i915#2672])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#2672] / [i915#3555])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#2672]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#5274])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#8708]) +19 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3458]) +25 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#8708])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3458]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#1825]) +10 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([fdo#111825]) +10 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#5354]) +38 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([fdo#109280]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#8708]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([fdo#110189]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3555] / [i915#8228])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3555] / [i915#8228])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3555] / [i915#8228])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6301])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([fdo#109289]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3555])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#8806])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#6953])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#5235]) +19 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#5235]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#5235]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#5235]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#6524] / [i915#6805])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#9683])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#9683]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#9681]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#9673])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#9673])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#9685])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#4235]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#4884])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4235] / [i915#5190])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#5289])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][177] ([i915#5465]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3555] / [i915#4098])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][179] -> [FAIL][180] ([i915#9196]) +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][181] -> [FAIL][182] ([i915#9196])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][183] ([fdo#109271] / [i915#2437])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#7387])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@perf@global-sseu-config-invalid.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3708] / [i915#4077])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3708] / [i915#4077])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@prime_vgem@basic-fence-mmap.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#2575]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@v3d/v3d_submit_cl@multisync-out-syncs:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([fdo#109315] / [i915#2575])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-10/igt@v3d/v3d_submit_cl@multisync-out-syncs.html

  * igt@v3d/v3d_submit_csd@bad-flag:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#2575]) +12 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@v3d/v3d_submit_csd@bad-flag.html

  * igt@v3d/v3d_wait_bo@unused-bo-0ns:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#2575]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@v3d/v3d_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#7711]) +6 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_label_bo@set-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#7711])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@vc4/vc4_label_bo@set-bad-handle.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#7711]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [FAIL][194] ([i915#2842]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][196] ([i915#2842]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          [ABORT][198] ([i915#7975] / [i915#8213]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][200] ([i915#5493]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][202] ([i915#9407]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][204] ([i915#5138]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [FAIL][206] ([i915#3743]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-snb:          [SKIP][208] ([fdo#109271]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          [FAIL][210] ([i915#6880]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * {igt@kms_pm_rpm@modeset-lpsp-stress}:
    - shard-dg2:          [SKIP][212] ([i915#9519]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [FAIL][214] ([i915#9196]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg1:          [FAIL][216] -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][218] ([i915#4349]) -> [PASS][219] +3 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-dg1:          [FAIL][220] ([i915#4349]) -> [PASS][221] +2 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][222] -> [INCOMPLETE][223] ([i915#9364])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [FAIL][224] ([i915#2842]) -> [FAIL][225] ([i915#2876])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7016]: https://gitlab.freedesktop.org/drm/intel/issues/7016
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
  [i915#8898]: https://gitlab.freedesktop.org/drm/intel/issues/8898
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9364]: https://gitlab.freedesktop.org/drm/intel/issues/9364
  [i915#9407]: https://gitlab.freedesktop.org/drm/intel/issues/9407
  [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
  [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
  [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
  [i915#9653]: https://gitlab.freedesktop.org/drm/intel/issues/9653
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9681]: https://gitlab.freedesktop.org/drm/intel/issues/9681
  [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7598 -> IGTPW_10254

  CI-20190529: 20190529
  CI_DRM_13914: 0b1d4056dbe497edc6d866ca5b3f54c5927bd7c0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html
  IGT_7598: 6be4fb999857e135d54a6643a57dfe394e9c6f2e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html

--===============8340230758691257653==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each pipe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126708/">https://patchwork.freedesktop.org/series/126708/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7598_full -&gt; IGTPW_10254_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_10254_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10254_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10254_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_frontbuffer_tracking@pipe-fbc-rte} (NEW):</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_eio@reset-stress:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-snb2/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8898">i915#8898</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb4/igt@gem_eio@reset-stress.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7598_full and IGTPW_10254_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10254_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@drm_fdinfo@busy@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk9/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9606">i915#9606</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@ccs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_exec_endless@dispatch@ccs1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7016">i915#7016</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@gem_exec_fair@basic-throttle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@gem_exec_fence@concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-8/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-9/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@gem_mmap@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_mmap_gtt@flink-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-6/igt@gem_pxp@create-regular-context-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@gem_readwrite@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-glk9/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@gen9_exec_parse@allowed-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-snb5/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb2/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +9 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_content_protection@lic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb4/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-10/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-16/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-14/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8806">i915#8806</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9681">i915#9681</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-2/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-5/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@multisync-out-syncs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-10/igt@v3d/v3d_submit_cl@multisync-out-syncs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-flag:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-5/igt@v3d/v3d_submit_csd@bad-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-18/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-4/igt@vc4/vc4_label_bo@set-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9407">i915#9407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-lpsp-stress}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9364">i915#9364</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7598/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2876">i915#2876</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7598 -&gt; IGTPW_10254</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13914: 0b1d4056dbe497edc6d866ca5b3f54c5927bd7c0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10254/index.html<br />
  IGT_7598: 6be4fb999857e135d54a6643a57dfe394e9c6f2e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8340230758691257653==--
