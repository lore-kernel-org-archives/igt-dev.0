Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4435679631509558775=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Jan 2022 14:31:11 -0000
Message-ID: <164156587105.24390.10149264514199978705@emeril.freedesktop.org>
References: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVGVzdHMg?=
 =?utf-8?q?and_intel=5Fgpu=5Ftop_with_fdinfo_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4435679631509558775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tests and intel_gpu_top with fdinfo support
URL   : https://patchwork.freedesktop.org/series/98555/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11052_full -> IGTPW_6542_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6542_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@drm_fdinfo@basics} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1] +47 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@drm_fdinfo@basics.html

  * {igt@drm_fdinfo@busy-check-all@bcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][2] +38 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk9/igt@drm_fdinfo@busy-check-all@bcs0.html

  * {igt@drm_fdinfo@busy@bcs0} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][3] +38 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@drm_fdinfo@busy@bcs0.html

  * {igt@drm_fdinfo@busy@vcs0} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][4] +29 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb4/igt@drm_fdinfo@busy@vcs0.html

  * {igt@drm_fdinfo@isolation@bcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5] +47 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@drm_fdinfo@isolation@bcs0.html
    - {shard-tglu}:       NOTRUN -> [FAIL][6] +42 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-5/igt@drm_fdinfo@isolation@bcs0.html

  * {igt@drm_fdinfo@most-busy-check-all@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][7] +41 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb7/igt@drm_fdinfo@most-busy-check-all@vecs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_dc@dc6-psr:
    - {shard-tglu}:       NOTRUN -> [SKIP][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-8/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - {shard-tglu}:       ([FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12]) ([i915#3002] / [i915#3690] / [i915#4312]) -> ([FAIL][13], [FAIL][14], [FAIL][15]) ([i915#3002] / [i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-5/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-3/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-5/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-3/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-2/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11052_full and IGTPW_6542_full:

### New IGT tests (57) ###

  * igt@drm_fdinfo@all-busy-check-all:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.26] s

  * igt@drm_fdinfo@basics:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.13] s

  * igt@drm_fdinfo@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@busy-check-all@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.61] s

  * igt@drm_fdinfo@busy-check-all@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.51] s

  * igt@drm_fdinfo@busy-check-all@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@busy-check-all@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@drm_fdinfo@busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@busy-hang@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.05] s

  * igt@drm_fdinfo@busy-hang@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.15] s

  * igt@drm_fdinfo@busy-hang@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.51] s

  * igt@drm_fdinfo@busy-hang@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@busy-hang@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@busy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@busy-idle-check-all@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@busy-idle-check-all@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.12] s

  * igt@drm_fdinfo@busy-idle-check-all@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.51] s

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - Statuses : 4 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@busy-idle-check-all@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@busy-idle@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.05] s

  * igt@drm_fdinfo@busy-idle@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.15] s

  * igt@drm_fdinfo@busy-idle@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.51] s

  * igt@drm_fdinfo@busy-idle@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@busy-idle@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@busy@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.05] s

  * igt@drm_fdinfo@busy@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.20] s

  * igt@drm_fdinfo@busy@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.51] s

  * igt@drm_fdinfo@busy@vcs1:
    - Statuses : 4 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@busy@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@idle:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@idle@bcs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@drm_fdinfo@idle@rcs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.03, 0.23] s

  * igt@drm_fdinfo@idle@vcs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@drm_fdinfo@idle@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@idle@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@drm_fdinfo@isolation:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@isolation@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.05] s

  * igt@drm_fdinfo@isolation@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.15] s

  * igt@drm_fdinfo@isolation@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.51] s

  * igt@drm_fdinfo@isolation@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@isolation@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@most-busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.02, 0.12] s

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@most-busy-check-all@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@most-busy-check-all@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@most-busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.02, 0.19] s

  * igt@drm_fdinfo@most-busy-idle-check-all@vcs0:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@drm_fdinfo@most-busy-idle-check-all@vcs1:
    - Statuses : 4 fail(s)
    - Exec time: [0.01] s

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs0:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_6542_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#1099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb2/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#280]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][18] -> [TIMEOUT][19] ([i915#2481] / [i915#3070])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([i915#4525]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#2842]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][26] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#2842]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#2842]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][33] ([i915#2842]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#112283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#112283])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@basic:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111656])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#4270])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#4270])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#2856])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb6/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#2527] / [i915#2856])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][45] ([i915#454])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][46] ([i915#454]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#1937])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#1937])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][49] -> [INCOMPLETE][50] ([i915#3921])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-snb5/igt@i915_selftest@live@hangcheck.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110725] / [fdo#111614])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][53] -> [DMESG-WARN][54] ([i915#118]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][55] ([i915#118])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-iclb:         [PASS][56] -> [FAIL][57] ([i915#1888])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271]) +110 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [i915#3886]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689] / [i915#3886])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271]) +166 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278]) +13 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb8/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615] / [i915#3689]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb4/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [i915#1149])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk3/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb5/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][76] ([i915#1319])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][77] ([i915#1319])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@kms_content_protection@atomic-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#1063]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109279] / [i915#3359]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][82] -> [DMESG-WARN][83] ([i915#180]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3359])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271]) +49 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109274] / [fdo#109278])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271]) +22 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk2/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#533]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3840])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> [INCOMPLETE][90] ([i915#180])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][91] ([i915#180] / [i915#636])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109274]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109274] / [fdo#111825]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][94] -> [DMESG-WARN][95] ([i915#180]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][96] -> [DMESG-WARN][97] ([i915#2867]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109280] / [fdo#111825]) +12 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109280]) +10 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][100] ([fdo#108145] / [i915#265]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][101] ([fdo#108145] / [i915#265])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][102] ([fdo#108145] / [i915#265]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#3536]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb7/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#3536]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#658])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][107] -> [SKIP][108] ([fdo#109441]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][109] ([i915#132] / [i915#3467]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109441])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][111] ([IGT#2])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl6/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][112] ([IGT#2])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          NOTRUN -> [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html

--===============4435679631509558775==
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
<tr><td><b>Series:</b></td><td>Tests and intel_gpu_top with fdinfo support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98555/">https://patchwork.freedesktop.org/series/98555/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11052_full -&gt; IGTPW_6542_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6542_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@drm_fdinfo@basics} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@drm_fdinfo@basics.html">FAIL</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>{igt@drm_fdinfo@busy-check-all@bcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk9/igt@drm_fdinfo@busy-check-all@bcs0.html">FAIL</a> +38 similar issues</li>
</ul>
</li>
<li>
<p>{igt@drm_fdinfo@busy@bcs0} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@drm_fdinfo@busy@bcs0.html">FAIL</a> +38 similar issues</li>
</ul>
</li>
<li>
<p>{igt@drm_fdinfo@busy@vcs0} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb4/igt@drm_fdinfo@busy@vcs0.html">FAIL</a> +29 similar issues</li>
</ul>
</li>
<li>
<p>{igt@drm_fdinfo@isolation@bcs0} (NEW):</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@drm_fdinfo@isolation@bcs0.html">FAIL</a> +47 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-5/igt@drm_fdinfo@isolation@bcs0.html">FAIL</a> +42 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@drm_fdinfo@most-busy-check-all@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb7/igt@drm_fdinfo@most-busy-check-all@vecs0.html">FAIL</a> +41 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-8/igt@i915_pm_dc@dc6-psr.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>{shard-tglu}:       (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-3/igt@runner@aborted.html">FAIL</a>) ([i915#3002] / [i915#3690] / [i915#4312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglu-2/igt@runner@aborted.html">FAIL</a>) ([i915#3002] / [i915#4312])</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11052_full and IGTPW_6542_full:</p>
<h3>New IGT tests (57)</h3>
<ul>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@basics:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@bcs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.03, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@vcs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.02, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6542_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb2/igt@gem_ctx_persistence@engines-persistence.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2481] / [i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb6/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@gem_lmem_swapping@basic.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb5/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527] / [i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-snb5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +110 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271]) +166 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb8/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#109278]) +13 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb4/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl4/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk3/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl7/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-snb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109271]) +49 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-forked-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk2/igt@kms_cursor_legacy@pipe-d-forked-move.html">SKIP</a> ([fdo#109271]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb1/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> ([i915#2867]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb7/igt@kms_plane_lowres@pipe-b-tiling-x.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-apl6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6542/shard-kbl4/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; [</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4435679631509558775==--
