Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3499933501320520456=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Sat, 23 Sep 2023 18:26:38 -0000
Message-ID: <169549359821.3503.8299731021528452474@emeril.freedesktop.org>
References: <20230922141118.3821111-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230922141118.3821111-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwv?=
 =?utf-8?q?i915=5Fquery=3A_Add_query-l3-bank-count_subtest?=
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

--===============3499933501320520456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel/i915_query: Add query-l3-bank-count subtest
URL   : https://patchwork.freedesktop.org/series/124121/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13670_full -> IGTPW_9853_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9853_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9853_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9853_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_query@query-l3-bank-count} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl3/igt@i915_query@query-l3-bank-count.html
    - shard-glk:          NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk8/igt@i915_query@query-l3-bank-count.html
    - shard-dg2:          NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@i915_query@query-l3-bank-count.html

  * {igt@i915_query@query-l3-bank-count-invalid} (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][4] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@i915_query@query-l3-bank-count-invalid.html
    - shard-snb:          NOTRUN -> [FAIL][5] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb4/igt@i915_query@query-l3-bank-count-invalid.html
    - shard-dg1:          NOTRUN -> [FAIL][6] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-14/igt@i915_query@query-l3-bank-count-invalid.html
    - shard-tglu:         NOTRUN -> [FAIL][7] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-6/igt@i915_query@query-l3-bank-count-invalid.html

  * igt@prime_vgem@basic-fence-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][8] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@prime_vgem@basic-fence-blt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13670_full and IGTPW_9853_full:

### New IGT tests (3) ###

  * igt@i915_query@query-l3-bank-count:
    - Statuses : 8 fail(s)
    - Exec time: [0.0] s

  * igt@i915_query@query-l3-bank-count-invalid:
    - Statuses : 6 fail(s)
    - Exec time: [0.0] s

  * igt@i915_query@query-l3-bank-count-support:
    - Statuses : 7 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9853_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#9318])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7701]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +12 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          [PASS][15] -> [FAIL][16] ([i915#7742])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_busy@semaphore.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#4873])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_caching@writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#3555]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][22] -> [INCOMPLETE][23] ([i915#7297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][24] -> [FAIL][25] ([i915#6268])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#8555]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_ctx_persistence@hang.html
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#1099]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb4/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#280]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][31] -> [ABORT][32] ([i915#7975] / [i915#8213])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-11/igt@gem_eio@hibernate.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          NOTRUN -> [FAIL][33] ([i915#5784])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@gem_eio@reset-stress.html
    - shard-snb:          NOTRUN -> [FAIL][34] ([i915#8898])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb6/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][35] -> [FAIL][36] ([i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-15/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#4525])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#6334])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][40] ([i915#4475])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@gem_exec_fair@basic-none.html
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][43] ([i915#2842]) +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4473] / [i915#4771]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4473])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-rkl:          [PASS][46] -> [FAIL][47] ([i915#2842])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@gem_exec_fair@basic-pace@vcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4812]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#7697]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_exec_gttfill@multigpu-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#7697])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#5107])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([fdo#112283])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([fdo#112283])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@gem_exec_params@secure-non-root.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([fdo#112283])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3281]) +21 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3281]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3281]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4537] / [i915#4812]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@gem_lmem_swapping@heavy-random.html
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#4613])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4613]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][67] -> [TIMEOUT][68] ([i915#5493])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#8289])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#284])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@gem_media_vme.html

  * igt@gem_mmap@bad-size:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@basic-write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077]) +19 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-read.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4270]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4270]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3282]) +9 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271]) +27 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8428]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4079]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4885])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_wb:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@gem_tiled_wb.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#3297]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_mixed_blits:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([fdo#109289])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@gen3_mixed_blits.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([fdo#109289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-7/igt@gen3_mixed_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#109289]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#2856]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#2856]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4881])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@i915_fb_tiling.html

  * igt@i915_hwmon@hwmon-write:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#7707])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@i915_hwmon@hwmon-write.html

  * igt@i915_module_load@load:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#6227])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][99] ([i915#8617])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#8436])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#8399]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#1397])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][104] -> [SKIP][105] ([i915#1397]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-17/igt@i915_pm_rpm@dpms-non-lpsp.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#1397]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271]) +81 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl4/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][108] -> [SKIP][109] ([i915#1397]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][110] -> [SKIP][111] ([i915#1397])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#6621])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#8925]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@i915_pm_rps@thresholds-park@gt1.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#6188])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#6188])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([fdo#109303])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([fdo#109302])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][118] -> [DMESG-FAIL][119] ([i915#5334])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         NOTRUN -> [ABORT][120] ([i915#7461] / [i915#9262])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#5190])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4212]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#4212])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#8502]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][125] ([i915#8247]) +3 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([fdo#111614]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([fdo#111615] / [i915#5286])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5286]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([fdo#111614]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([fdo#111614])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][133] ([fdo#111614] / [i915#3638])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [PASS][134] -> [FAIL][135] ([i915#3743])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([fdo#111615])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([fdo#111615])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5190]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([fdo#111615]) +14 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([fdo#110723])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#2705])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3734] / [i915#5354] / [i915#6095]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#3689] / [i915#3886] / [i915#5354]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#5354]) +28 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#5354] / [i915#6095]) +51 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#3689] / [i915#5354]) +18 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5354] / [i915#6095]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#3886] / [i915#5354] / [i915#6095]) +16 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#5354] / [i915#6095])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][150] ([fdo#109271] / [i915#3886]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][151] ([fdo#109271] / [i915#3886])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#5354]) +12 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-7/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#5354] / [i915#6095]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#3689] / [i915#5354] / [i915#6095]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#4087]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([fdo#111827]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#7828]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7828]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#7828]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#7828]) +16 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#3299])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][163] ([i915#7173])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#6944]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7118]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3555]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3555] / [i915#8814]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#3359])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3359]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#109274])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([fdo#111767] / [i915#3546])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#4213]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([fdo#109274] / [i915#5354]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#9226] / [i915#9261]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#9227])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3555]) +6 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8812])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#8812])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3555] / [i915#3840])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [PASS][181] -> [INCOMPLETE][182] ([i915#8912])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-11/igt@kms_fbcon_fbt@fbc-suspend.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([fdo#110189] / [i915#3955])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3469])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([fdo#109274]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([fdo#109274] / [i915#3637])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3637]) +9 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([fdo#111825]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#8381]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#2672] / [i915#3555]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#2587] / [i915#2672])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#2672])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#8810])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#2672]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#2672]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#5274])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][197] ([i915#6880])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#8708]) +16 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([fdo#111825] / [i915#1825]) +13 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#1825]) +52 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([fdo#109280]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [PASS][202] -> [FAIL][203] ([i915#6880])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#5460])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3458]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#8708]) +15 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3023]) +10 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8228])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8228])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_hdr@static-toggle.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#6301])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([fdo#109289]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][213] ([i915#4573]) +1 other test fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl6/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3582]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8806])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3546]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][218] -> [FAIL][219] ([i915#8292])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][220] ([i915#8292])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#5176]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#5176]) +11 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#5176]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#5176]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#5235]) +11 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#5235]) +9 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#5235]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#5235]) +19 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#5235]) +7 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#6524] / [i915#6805])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#658])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#658])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][233] ([fdo#109271] / [i915#658])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([fdo#111068] / [i915#658])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#658])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#4348]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@basic:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([fdo#110189]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@kms_psr@basic.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#1072]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@sprite_render:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#1072]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_psr@sprite_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#5461] / [i915#658])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][241] ([fdo#109271]) +300 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#4884])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#5289])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#4235] / [i915#5190])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][245] ([fdo#111615] / [i915#5289])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#4235]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][247] ([i915#5465]) +1 other test fail
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8809])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#8623])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([fdo#109309])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - shard-snb:          [PASS][251] -> [FAIL][252] ([i915#9196])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-snb5/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb5/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-c:
    - shard-dg1:          [PASS][253] -> [FAIL][254] ([i915#9196]) +1 other test fail
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-13/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html

  * igt@kms_universal_plane@universal-plane-pipe-d-sanity:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#4070] / [i915#533] / [i915#6768]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-d-sanity.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-dg2:          [PASS][256] -> [FAIL][257] ([fdo#103375])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#4070] / [i915#6768])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_vblank@pipe-c-query-idle-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-mtlp:         NOTRUN -> [ABORT][259] ([i915#9262]) +5 other tests abort
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-mtlp:         [PASS][260] -> [ABORT][261] ([i915#9262]) +2 other tests abort
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#2437]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][263] ([fdo#109271] / [i915#2437])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#8850])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#8850])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@perf_pmu@cpu-hotplug.html
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#8850])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-suspend:
    - shard-snb:          NOTRUN -> [DMESG-WARN][267] ([i915#8841]) +5 other tests dmesg-warn
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb5/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][268] ([i915#8445])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@prime_vgem@basic-blt.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3291] / [i915#3708])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@prime_vgem@basic-fence-read.html
    - shard-rkl:          NOTRUN -> [SKIP][270] ([fdo#109295] / [i915#3291] / [i915#3708])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#3708])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3708])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#3708]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@prime_vgem@fence-read-hang.html

  * igt@v3d/v3d_submit_cl@bad-bo:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2575]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-bo.html

  * igt@v3d/v3d_submit_cl@valid-submission:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#2575]) +21 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@v3d/v3d_submit_cl@valid-submission.html

  * igt@v3d/v3d_wait_bo@unused-bo-0ns:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([fdo#109315]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@v3d/v3d_wait_bo@unused-bo-0ns.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([fdo#109315] / [i915#2575]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@v3d/v3d_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_label_bo@set-bad-handle:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#2575])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@vc4/vc4_label_bo@set-bad-handle.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#7711]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#7711]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#7711]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html

  
#### Possible fixes ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [INCOMPLETE][282] ([i915#9283]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][284] ([i915#2410]) -> [PASS][285] +3 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][286] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-10/igt@gem_eio@hibernate.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][288] ([i915#5784]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-2/igt@gem_eio@kms.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][290] ([i915#5784]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-17/igt@gem_eio@reset-stress.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][292] ([i915#2842]) -> [PASS][293] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][294] ([i915#7069]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][296] ([i915#1397]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][298] ([i915#1397]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][300] ([i915#3743]) -> [PASS][301] +2 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][302] ([i915#2346]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-dg2:          [FAIL][304] ([fdo#103375]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][306] ([i915#433]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [INCOMPLETE][308] ([i915#180] / [i915#9392]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][310] ([i915#8292]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * {igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a}:
    - shard-rkl:          [SKIP][312] ([i915#1937]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [INCOMPLETE][314] ([i915#8875]) -> [PASS][315] +1 other test pass
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-90.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - shard-dg1:          [FAIL][316] ([i915#9196]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
    - shard-tglu:         [FAIL][318] ([i915#9196]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-dg2:          [FAIL][320] ([i915#4349]) -> [PASS][321] +3 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-7/igt@perf_pmu@busy-idle@ccs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@busy-idle@vecs0:
    - shard-dg1:          [FAIL][322] ([i915#4349]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-18/igt@perf_pmu@busy-idle@vecs0.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-14/igt@perf_pmu@busy-idle@vecs0.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-dg1:          [SKIP][324] ([i915#7116]) -> [SKIP][325] ([fdo#109300])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-19/igt@kms_content_protection@mei_interface.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-17/igt@kms_content_protection@mei_interface.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][326] ([i915#3955]) -> [SKIP][327] ([fdo#110189] / [i915#3955])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][328] ([i915#4070] / [i915#4816]) -> [SKIP][329] ([i915#4816])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_psr@cursor_plane_move:
    - shard-dg1:          [SKIP][330] ([i915#1072] / [i915#4078]) -> [SKIP][331] ([i915#1072]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-13/igt@kms_psr@cursor_plane_move.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-14/igt@kms_psr@cursor_plane_move.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8436]: https://gitlab.freedesktop.org/drm/intel/issues/8436
  [i915#8445]: https://gitlab.freedesktop.org/drm/intel/issues/8445
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8850]: https://gitlab.freedesktop.org/drm/intel/issues/8850
  [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
  [i915#8898]: https://gitlab.freedesktop.org/drm/intel/issues/8898
  [i915#8912]: https://gitlab.freedesktop.org/drm/intel/issues/8912
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9226]: https://gitlab.freedesktop.org/drm/intel/issues/9226
  [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
  [i915#9261]: https://gitlab.freedesktop.org/drm/intel/issues/9261
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9283]: https://gitlab.freedesktop.org/drm/intel/issues/9283
  [i915#9292]: https://gitlab.freedesktop.org/drm/intel/issues/9292
  [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
  [i915#9298]: https://gitlab.freedesktop.org/drm/intel/issues/9298
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
  [i915#9392]: https://gitlab.freedesktop.org/drm/intel/issues/9392


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7498 -> IGTPW_9853

  CI-20190529: 20190529
  CI_DRM_13670: ba554d199b6e91dcb1097e264d7ffa4bdf7da435 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9853: 9853
  IGT_7498: 05d14fd260a3cf9dc00ed24733d5589eee32ec08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/index.html

--===============3499933501320520456==
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
<tr><td><b>Series:</b></td><td>intel/i915_query: Add query-l3-bank-count subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124121/">https://patchwork.freedesktop.org/series/124121/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13670_full -&gt; IGTPW_9853_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9853_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9853_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9853_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_query@query-l3-bank-count} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl3/igt@i915_query@query-l3-bank-count.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk8/igt@i915_query@query-l3-bank-count.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@i915_query@query-l3-bank-count.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_query@query-l3-bank-count-invalid} (NEW):</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@i915_query@query-l3-bank-count-invalid.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb4/igt@i915_query@query-l3-bank-count-invalid.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-14/igt@i915_query@query-l3-bank-count-invalid.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-6/igt@i915_query@query-l3-bank-count-invalid.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@prime_vgem@basic-fence-blt.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13670_full and IGTPW_9853_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@i915_query@query-l3-bank-count:</p>
<ul>
<li>Statuses : 8 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-l3-bank-count-invalid:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-l3-bank-count-support:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9853_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_caching@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7297">i915#7297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb4/igt@gem_ctx_persistence@processes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb6/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8898">i915#8898</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_exec_fair@basic-pace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gem_exec_fence@concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl3/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@gem_mmap@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_wb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@gem_tiled_wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-7/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8617">i915#8617</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8436">i915#8436</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-17/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl4/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@i915_pm_rps@thresholds-park@gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6188">i915#6188</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6188">i915#6188</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@i915_suspend@debugfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +12 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-7/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9226">i915#9226</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9261">i915#9261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9227">i915#9227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-11/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8912">i915#8912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8810">i915#8810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl6/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +6 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8806">i915#8806</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-3/igt@kms_psr@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_psr@sprite_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +300 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-snb5/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb5/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-13/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-d-sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-d-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_vblank@pipe-c-query-idle-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8850">i915#8850</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8850">i915#8850</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8850">i915#8850</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-snb5/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@prime_vgem@basic-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8445">i915#8445</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-18/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-submission:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-3/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-0ns:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-4/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-10/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-handle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@vc4/vc4_label_bo@set-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-7/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9283">i915#9283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8398">i915#8398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-2/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-16/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-7/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9392">i915#9392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-90.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8875">i915#8875</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg2-7/igt@perf_pmu@busy-idle@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg2-3/igt@perf_pmu@busy-idle@ccs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-18/igt@perf_pmu@busy-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-14/igt@perf_pmu@busy-idle@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-19/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-17/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13670/shard-dg1-13/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9853/shard-dg1-14/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7498 -&gt; IGTPW_9853</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13670: ba554d199b6e91dcb1097e264d7ffa4bdf7da435 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9853: 9853<br />
  IGT_7498: 05d14fd260a3cf9dc00ed24733d5589eee32ec08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3499933501320520456==--
