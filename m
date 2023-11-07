Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8789644160138062505=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Tue, 07 Nov 2023 06:03:13 -0000
Message-ID: <169933699375.21167.14743745933560649306@emeril.freedesktop.org>
References: <20231106195947.14640-1-lukasz.laguna@intel.com>
In-Reply-To: <20231106195947.14640-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW5pdGlh?=
 =?utf-8?q?l_SR-IOV_validation?=
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

--===============8789644160138062505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial SR-IOV validation
URL   : https://patchwork.freedesktop.org/series/126034/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13844_full -> IGTPW_10122_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10122_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10122_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (1): shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10122_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - shard-glk:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk1/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk3/igt@i915_selftest@live@execlists.html

  * igt@kms_flip@dpms-off-confusion@a-dp1:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-apl7/igt@kms_flip@dpms-off-confusion@a-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl6/igt@kms_flip@dpms-off-confusion@a-dp1.html

  * {igt@sriov_basic@bind-unbind-vf} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@sriov_basic@bind-unbind-vf.html

  * {igt@sriov_basic@enable-vfs-autoprobe-on} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][8] +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * {igt@sriov_basic@enable-vfs-bind-all-unbind-all} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][9] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-all-unbind-all.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@drm_fdinfo@context-close-stress}:
    - shard-dg2:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@drm_fdinfo@context-close-stress.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13844_full and IGTPW_10122_full:

### New IGT tests (5) ###

  * igt@sriov_basic@bind-unbind-vf:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-bind-all-unbind-all:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10122_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [PASS][11] -> [SKIP][12] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][13] ([i915#7742])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@drm_fdinfo@idle@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +30 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][15] -> [FAIL][16] ([i915#7742])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_read@short-buffer-nonblock:
    - shard-rkl:          [PASS][17] -> [SKIP][18] ([i915#4098]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@drm_read@short-buffer-nonblock.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@drm_read@short-buffer-nonblock.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#7957])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#4098] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([fdo#109314])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1099])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb1/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#5882]) +9 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4771])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4525]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html
    - shard-snb:          NOTRUN -> [SKIP][33] ([fdo#109271]) +50 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-rkl:          NOTRUN -> [FAIL][35] ([i915#9606])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4473])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][37] ([i915#2842]) +4 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#2842])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglu:         NOTRUN -> [FAIL][40] ([i915#2842]) +4 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [PASS][41] -> [FAIL][42] ([i915#2842]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([fdo#112283]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([fdo#112283])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +12 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3281]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-mtlp:         [PASS][51] -> [ABORT][52] ([i915#8213] / [i915#9414]) +1 other test abort
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-7/igt@gem_exec_suspend@basic-s3@smem.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-rkl:          NOTRUN -> [ABORT][53] ([i915#7975] / [i915#8213])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4860])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#4613]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl2/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-10/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3282])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap@short-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@isolation:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4077])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@gem_mmap_gtt@isolation.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [PASS][65] -> [SKIP][66] ([i915#3282]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_pwrite@basic-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4270]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4270]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#768])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8428]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#8411])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4079]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4079])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4885])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@gem_softpin@evict-snoop.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][78] ([i915#5889])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4879])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3323])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [PASS][84] -> [SKIP][85] ([i915#3281]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_userptr_blits@relocations.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-rkl:          NOTRUN -> [FAIL][86] ([i915#3318])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([fdo#109289]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#2856]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gen9_exec_parse@secure-batches.html
    - shard-rkl:          [PASS][89] -> [SKIP][90] ([i915#2527]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#2527])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#2527]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][93] -> [ABORT][94] ([i915#8489] / [i915#8668])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#6412])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#8399]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [PASS][97] -> [FAIL][98] ([i915#3591])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#8925])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_power@sanity:
    - shard-rkl:          [PASS][100] -> [SKIP][101] ([i915#7984])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@i915_power@sanity.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#6245])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([fdo#109303])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([fdo#109302])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5723])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][106] ([i915#5334])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4077]) +17 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4212]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4212])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4212] / [i915#5608])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#6228])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#1769] / [i915#3555]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#1769])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#5286]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538] / [i915#5286])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([fdo#111614]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([fdo#111614] / [i915#3638]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([fdo#111614]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][119] -> [FAIL][120] ([i915#3743]) +1 other test fail
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#5190]) +24 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#1845] / [i915#4098]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([fdo#111615]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5190]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([fdo#110723]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([fdo#111615])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#2705])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4087] / [i915#7213])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#7213] / [i915#9010]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4087]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([fdo#111827]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([fdo#111827])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#7828]) +10 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#7828]) +8 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#7828]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-0-50@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#4098]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-c.html

  * igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:
    - shard-rkl:          NOTRUN -> [FAIL][137] ([i915#6892]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma.html

  * igt@kms_content_protection@atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#6944])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#7118])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3116])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][141] ([i915#7173]) +1 other test timeout
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl6/igt@kms_content_protection@lic@pipe-a-dp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][142] ([i915#7173])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#7118])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3359]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#3555] / [i915#8814])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#3555]) +8 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([fdo#109274] / [i915#5354]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][150] ([fdo#111767] / [fdo#111825])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([fdo#111825])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-16/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4103] / [i915#4213] / [i915#5608])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#4103]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#3546]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [PASS][155] -> [SKIP][156] ([i915#1845] / [i915#4098]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][157] -> [FAIL][158] ([i915#2346])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][159] -> [FAIL][160] ([i915#2346])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#4103] / [i915#4213])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#9226] / [i915#9261]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#9227])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#9227])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#9226] / [i915#9261]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#1257])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#8812])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#3555] / [i915#3840])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3555] / [i915#3840]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#3555] / [i915#3840])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#8381]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([fdo#111825]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3637]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([fdo#109274]) +10 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][175] ([i915#8841]) +1 other test dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#3637] / [i915#4098]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#2672]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#8810])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#2587] / [i915#2672])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3555]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#2672] / [i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#2672])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#2672]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([fdo#109285])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([fdo#109285])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#5274])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#8708]) +20 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#5354]) +44 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([fdo#109280]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-rkl:          [PASS][190] -> [SKIP][191] ([i915#1849] / [i915#4098]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8708]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#1849] / [i915#4098]) +7 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3023]) +18 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#1825]) +11 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([fdo#111825] / [i915#1825]) +36 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([fdo#110189]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#5439])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5460])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3458]) +24 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3458]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#6118])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#6301])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([fdo#109289]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([fdo#109289]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#4098] / [i915#8825])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_plane@pixel-format.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][207] ([i915#4573]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#6953] / [i915#8152])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][209] ([i915#8292])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#5176] / [i915#9423]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#5235]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#5235]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#5235]) +7 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#5235]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#5235])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#6524] / [i915#6805]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#6524])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][220] ([fdo#109271] / [i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#2920])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][222] ([fdo#109271] / [i915#658]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#658]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([fdo#111068] / [i915#658]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@primary_mmap_cpu:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#1072]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_psr@primary_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-glk:          NOTRUN -> [SKIP][226] ([fdo#109271]) +37 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#1072]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#5461] / [i915#658])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-rkl:          [PASS][229] -> [INCOMPLETE][230] ([i915#8875] / [i915#9475] / [i915#9569])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#4235])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#4235] / [i915#5190])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][233] ([fdo#111615] / [i915#5289])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#4235]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8809])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][236] ([IGT#2])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8623])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][238] -> [FAIL][239] ([i915#9196])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#2437])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#2437])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#2437])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][243] ([i915#8724])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([fdo#109289]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [PASS][245] -> [SKIP][246] ([i915#2436])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#7387])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][248] -> [FAIL][249] ([i915#4349])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#8850])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][251] ([i915#6806])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#8516])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([fdo#109291])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [PASS][254] -> [SKIP][255] ([fdo#109295] / [i915#3708] / [i915#4098])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#3708] / [i915#4077])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#3708] / [i915#4077])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3291] / [i915#3708])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([fdo#109295] / [i915#3708])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@prime_vgem@fence-read-hang.html

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled:
    - shard-rkl:          NOTRUN -> [FAIL][260] ([i915#9583]) +3 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:
    - shard-dg2:          NOTRUN -> [FAIL][261] ([i915#9583]) +2 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:
    - shard-snb:          NOTRUN -> [FAIL][262] ([i915#9583])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb7/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html

  * igt@v3d/v3d_submit_cl@multiple-job-submission:
    - shard-apl:          NOTRUN -> [SKIP][263] ([fdo#109271]) +144 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl3/igt@v3d/v3d_submit_cl@multiple-job-submission.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#2575]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_csd@bad-multisync-extension:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([fdo#109315]) +10 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-multisync-extension.html

  * igt@v3d/v3d_submit_csd@bad-multisync-pad:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#2575]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-15/igt@v3d/v3d_submit_csd@bad-multisync-pad.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2575]) +20 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@v3d/v3d_wait_bo@unused-bo-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([fdo#109315] / [i915#2575]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-3/igt@v3d/v3d_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#7711]) +12 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_tiling@get-bad-handle:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#7711]) +7 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@vc4/vc4_tiling@get-bad-handle.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#7711]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_tiling@set-bad-handle:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#2575])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-3/igt@vc4/vc4_tiling@set-bad-handle.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][273] ([i915#7742]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@fbdev@read:
    - shard-rkl:          [SKIP][275] ([i915#2582]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@fbdev@read.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@fbdev@read.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-rkl:          [SKIP][277] ([i915#6252]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][279] ([i915#7975] / [i915#8213]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-1/igt@gem_eio@hibernate.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [ABORT][281] ([i915#9414]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][283] ([i915#5784]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-2/igt@gem_eio@kms.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][285] ([i915#5784]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-15/igt@gem_eio@unwedge-stress.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@fairslice:
    - shard-rkl:          [SKIP][287] ([Intel XE#874]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_exec_balancer@fairslice.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][289] ([i915#2846]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][291] ([i915#2842]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][293] ([i915#3281]) -> [PASS][294] +3 other tests pass
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][295] ([i915#5493]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][297] ([i915#9559]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [FAIL][299] ([i915#3591]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          [FAIL][301] ([fdo#103375]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][303] ([i915#7790]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-snb7/igt@i915_pm_rps@reset.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][305] ([i915#1845] / [i915#4098]) -> [PASS][306] +26 other tests pass
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * {igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:
    - shard-rkl:          [SKIP][307] ([i915#4098]) -> [PASS][308] +13 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][309] ([i915#2346]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][311] ([i915#1849] / [i915#4098]) -> [PASS][312] +9 other tests pass
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * {igt@kms_pm_rpm@i2c}:
    - shard-dg2:          [FAIL][313] ([i915#8717]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_pm_rpm@i2c.html

  * {igt@kms_pm_rpm@modeset-lpsp}:
    - shard-dg1:          [SKIP][315] ([i915#9519]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html

  * {igt@kms_pm_rpm@modeset-non-lpsp}:
    - shard-rkl:          [SKIP][317] ([i915#9519]) -> [PASS][318] +2 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-rkl:          [SKIP][319] ([i915#1849]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-rkl:          [INCOMPLETE][321] ([i915#8875] / [i915#9569]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_rotation_crc@bad-pixel-format.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-tglu:         [FAIL][323] ([i915#9196]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][325] ([i915#7484]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][327] ([i915#3555]) -> [SKIP][328] ([i915#7957])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][329] ([i915#7957]) -> [SKIP][330] ([i915#9323])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_ccs@suspend-resume.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [SKIP][331] ([i915#9591]) -> [FAIL][332] ([i915#2842])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          [SKIP][333] ([i915#4423] / [i915#4565]) -> [SKIP][334] ([i915#4565])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][335] ([i915#3282]) -> [WARN][336] ([i915#2658])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          [SKIP][337] ([i915#2527] / [i915#4423]) -> [SKIP][338] ([i915#2527])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-16/igt@gen9_exec_parse@bb-secure.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [INCOMPLETE][339] ([i915#4528]) -> [DMESG-WARN][340] ([i915#8841])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][341] ([i915#4098]) -> [SKIP][342] ([i915#5286]) +5 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][343] ([i915#5286]) -> [SKIP][344] ([i915#4098]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][345] ([fdo#111614] / [i915#3638]) -> [SKIP][346] ([i915#1845] / [i915#4098])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][347] ([i915#1845] / [i915#4098]) -> [SKIP][348] ([fdo#111614] / [i915#3638]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-rkl:          [SKIP][349] ([fdo#110723]) -> [SKIP][350] ([i915#1845] / [i915#4098])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][351] ([i915#1845] / [i915#4098]) -> [SKIP][352] ([fdo#110723]) +6 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][353] ([i915#1845] / [i915#4098]) -> [SKIP][354] ([i915#3116])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][355] ([i915#4098]) -> [SKIP][356] ([i915#3555]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][357] ([i915#3359]) -> [SKIP][358] ([i915#4098])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x512.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-rkl:          [SKIP][359] ([i915#1845] / [i915#4098]) -> [SKIP][360] ([fdo#111825]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          [SKIP][361] ([i915#1845] / [i915#4098]) -> [SKIP][362] ([fdo#111767] / [fdo#111825]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][363] ([i915#1845] / [i915#4098]) -> [SKIP][364] ([i915#4103])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][365] ([i915#3555] / [i915#3840]) -> [SKIP][366] ([i915#4098])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][367] ([i915#3955]) -> [SKIP][368] ([fdo#110189] / [i915#3955])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][369] ([i915#1849] / [i915#4098]) -> [SKIP][370] ([fdo#111825])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][371] ([i915#1849] / [i915#4098]) -> [SKIP][372] ([fdo#111825] / [i915#1825]) +45 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][373] ([i915#1849] / [i915#4098]) -> [SKIP][374] ([i915#5439])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][375] ([fdo#111825] / [i915#1825]) -> [SKIP][376] ([i915#1849] / [i915#4098]) +12 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          [SKIP][377] ([i915#1849] / [i915#4098]) -> [SKIP][378] ([i915#3023]) +29 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][379] ([i915#3023]) -> [SKIP][380] ([i915#1849] / [i915#4098]) +6 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          [SKIP][381] ([i915#1845] / [i915#4098]) -> [SKIP][382] ([i915#3555] / [i915#8228])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][383] ([i915#3555] / [i915#8228]) -> [SKIP][384] ([i915#1845] / [i915#4098])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][385] ([i915#4070] / [i915#4816]) -> [SKIP][386] ([i915#4816])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][387] ([i915#1845] / [i915#4098]) -> [SKIP][388] ([i915#6301])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_panel_fitting@legacy.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_panel_fitting@legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [Intel XE#874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/874
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
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
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
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
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
  [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6228]: https://gitlab.freedesktop.org/drm/intel/issues/6228
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
  [i915#6892]: https://gitlab.freedesktop.org/drm/intel/issues/6892
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
  [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/intel/issues/8825
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8850]: https://gitlab.freedesktop.org/drm/intel/issues/8850
  [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#9010]: https://gitlab.freedesktop.org/drm/intel/issues/9010
  [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9226]: https://gitlab.freedesktop.org/drm/intel/issues/9226
  [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
  [i915#9261]: https://gitlab.freedesktop.org/drm/intel/issues/9261
  [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
  [i915#9414]: https://git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/index.html

--===============8789644160138062505==
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
<tr><td><b>Series:</b></td><td>Initial SR-IOV validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126034/">https://patchwork.freedesktop.org/series/126034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13844_full -&gt; IGTPW_10122_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10122_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10122_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/index.html</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10122_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk1/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk3/igt@i915_selftest@live@execlists.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-apl7/igt@kms_flip@dpms-off-confusion@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl6/igt@kms_flip@dpms-off-confusion@a-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@sriov_basic@bind-unbind-vf} (NEW):</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@sriov_basic@enable-vfs-autoprobe-on} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@sriov_basic@enable-vfs-bind-all-unbind-all} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-all-unbind-all.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@drm_fdinfo@context-close-stress}:<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@drm_fdinfo@context-close-stress.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13844_full and IGTPW_10122_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-all-unbind-all:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10122_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@drm_read@short-buffer-nonblock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@drm_read@short-buffer-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7957">i915#7957</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb1/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +50 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-7/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://git">i915#9414</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl2/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-10/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@short-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_mmap@short-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@isolation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@gem_mmap_gtt@isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_pwrite@basic-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5889">i915#5889</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_userptr_blits@relocations.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +1 other test skip</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +24 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +8 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9010">i915#9010</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6892">i915#6892</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl6/igt@kms_content_protection@lic@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-16/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9226">i915#9226</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9261">i915#9261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9227">i915#9227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9227">i915#9227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9226">i915#9226</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9261">i915#9261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8810">i915#8810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_plane@pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_psr@primary_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk2/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8875">i915#8875</a> / [i915#9475] / [i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8724">i915#8724</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8850">i915#8850</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6806">i915#6806</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled.html">FAIL</a> ([i915#9583]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html">FAIL</a> ([i915#9583]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb7/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@multiple-job-submission:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl3/igt@v3d/v3d_submit_cl@multiple-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-extension:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-multisync-extension.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-pad:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-15/igt@v3d/v3d_submit_csd@bad-multisync-pad.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-3/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-6/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-handle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@vc4/vc4_tiling@get-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-7/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-handle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-3/igt@vc4/vc4_tiling@set-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_ctx_persistence@engines-hang@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-1/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> (<a href="https://git">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-mtlp-8/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-2/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-13/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/874">Intel XE#874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#9559]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-snb7/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@i2c}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-2/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8717">i915#8717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-11/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-lpsp}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_rotation_crc@bad-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8875">i915#8875</a> / [i915#9569]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_rotation_crc@bad-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7957">i915#7957</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7957">i915#7957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> ([i915#9591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-dg1-16/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13844/shard-rkl-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10122/shard-rkl-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============8789644160138062505==--
