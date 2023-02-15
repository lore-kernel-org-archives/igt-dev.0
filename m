Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7534382430419786144=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Wed, 15 Feb 2023 14:12:51 -0000
Message-ID: <167647037197.30600.476171551493002035@emeril.freedesktop.org>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRW5hYmxl?=
 =?utf-8?q?_OAM_support_in_IGT_and_GPUvis_=28rev2=29?=
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

--===============7534382430419786144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable OAM support in IGT and GPUvis (rev2)
URL   : https://patchwork.freedesktop.org/series/114023/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12739_full -> IGTPW_8498_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8498_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8498_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8498_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-internal-1us:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-snb7/igt@gem_eio@in-flight-internal-1us.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-snb4/igt@gem_eio@in-flight-internal-1us.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][3] -> [CRASH][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-apl1/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-y.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-y.html

  * {igt@perf@enable-disable@0-rcs0} (NEW):
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@perf@enable-disable@0-rcs0.html
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-16/igt@perf@enable-disable@0-rcs0.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][9] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl1/igt@perf@enable-disable@0-rcs0.html
    - {shard-tglu}:       NOTRUN -> [INCOMPLETE][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-1/igt@perf@enable-disable@0-rcs0.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk5/igt@perf@enable-disable@0-rcs0.html

  * {igt@perf@gen12-gt-concurrent-oa-buffer-read} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][12] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-4/igt@perf@gen12-gt-concurrent-oa-buffer-read.html

  * {igt@perf@gen12-gt-exclusive-stream-ctx-handle} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@perf@gen12-gt-exclusive-stream-ctx-handle.html

  * {igt@perf@gen12-gt-exclusive-stream-sample-oa} (NEW):
    - {shard-tglu-10}:    NOTRUN -> [SKIP][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-10/igt@perf@gen12-gt-exclusive-stream-sample-oa.html

  * {igt@perf@global-sseu-config-invalid@0-rcs0} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][15] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-6/igt@perf@global-sseu-config-invalid@0-rcs0.html

  * {igt@perf@non-zero-reason@0-rcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk3/igt@perf@non-zero-reason@0-rcs0.html
    - {shard-rkl}:        NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@perf@non-zero-reason@0-rcs0.html
    - {shard-dg1}:        NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-18/igt@perf@non-zero-reason@0-rcs0.html
    - shard-apl:          NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl2/igt@perf@non-zero-reason@0-rcs0.html
    - {shard-tglu-9}:     NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-9/igt@perf@non-zero-reason@0-rcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_scaling@invalid-parameters}:
    - {shard-rkl}:        [SKIP][21] ([i915#8152]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@kms_plane_scaling@invalid-parameters.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-1/igt@kms_plane_scaling@invalid-parameters.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12739_full and IGTPW_8498_full:

### New IGT tests (280) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@all-busy-check-all:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@basics:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-check-all:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-check-all@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-check-all@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-check-all@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-check-all@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-hang:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-hang@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-hang@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-hang@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-hang@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-hang@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle-check-all:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle-check-all@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle-check-all@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle-check-all@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle-check-all@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy-idle@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@busy@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@idle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@idle@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@idle@rcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@idle@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@idle@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@idle@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@isolation@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@isolation@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@isolation@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@isolation@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-check-all:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-check-all@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-check-all@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-idle-check-all@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ccs@block-copy-inplace:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@clean:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@clean@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@clean@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@clean@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@clean@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@clean@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-create:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-create@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-create@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-create@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-create@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-create@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-switch@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-switch@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-switch@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-switch@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@dirty-switch@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@nonpriv-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@nonpriv-switch@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv-switch@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv-switch@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv-switch@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv@rcs0:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@nonpriv@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@preservation-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@preservation-reset@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-reset@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-reset@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-reset@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-reset@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@preservation@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-shared-gtt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-shared-gtt@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-shared-gtt@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-shared-gtt@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-shared-gtt@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-shared-gtt@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-independent:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-independent@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-independent@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-independent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-out-order:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-out-order@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-out-order@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-out-order@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-out-order@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-out-order@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-promotion:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-promotion@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-promotion@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-promotion@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-promotion@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-smoketest:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@q-smoketest@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-smoketest@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-smoketest@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-smoketest@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-smoketest@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_big@single:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@semaphore-power:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_mmap@bad-offset:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_mmap@bad-size:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap@pf-nonblock:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@bad-object:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_gtt@pf-nonblock:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_offset@oob-read:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_wc@bad-object:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_wc@bad-offset:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_wc@bad-size:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_mmap_wc@pf-nonblock:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@yf-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_watchdog@default-physical:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_watchdog@default-virtual:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_dc@dc9-dpms:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_query@test-query-geometry-subslices:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_lease@atomic_implicit_crtc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_lease@cursor_implicit_plane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_lease@page_flip_implicit_plane:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_lease@setcrtc_implicit_plane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@blocking-parameterized:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@perf@blocking@0-rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@perf@buffer-fill@0-rcs0:
    - Statuses : 4 incomplete(s)
    - Exec time: [0.0] s

  * igt@perf@enable-disable@0-rcs0:
    - Statuses : 5 incomplete(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-gt-concurrent-oa-buffer-read:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-gt-exclusive-stream-ctx-handle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-gt-exclusive-stream-sample-oa:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-invalid-class-instance:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-mi-rpc@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-oa-tlb-invalidate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-oa-tlb-invalidate@0-rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@perf@gen12-unprivileged-single-ctx-counters@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@perf@global-sseu-config:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@perf@global-sseu-config-invalid:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@perf@global-sseu-config-invalid@0-rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@global-sseu-config@0-rcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-zero-reason@0-rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@perf@oa-exponents@0-rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@perf@oa-formats@0-rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@perf@polling-parameterized:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@perf@polling@0-rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@perf@stress-open-close@0-rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@prime_mmap@test_forked_cpu_write@test_forked_cpu_write-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@idempotent@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@idempotent@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@idempotent@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@idempotent@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@invalid@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@invalid@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@invalid@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@invalid@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@invalid@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@mixed:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@mixed@bcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@mixed@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@mixed@vcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@mixed@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@nopreempt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@nopreempt@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@nopreempt@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@nopreempt@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@precise@bcs0:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@precise@rcs0:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@precise@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@idempotent@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@idempotent@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@idempotent@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@idempotent@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@idempotent@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@invalid@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@invalid@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@invalid@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@invalid@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@invalid@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@timeout:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@timeout@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@timeout@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@timeout@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@timeout@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@duration@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@idempotent@bcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent@vcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@invalid@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@timeout:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@timeout@bcs0:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@timeout@rcs0:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@timeout@vcs0:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8498_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@busy-idle (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][23] ([i915#5563]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@drm_fdinfo@busy-idle.html

  * igt@drm_fdinfo@idle@rcs0 (NEW):
    - {shard-rkl}:        [PASS][24] -> [FAIL][25] ([i915#7742]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@drm_fdinfo@idle@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2842]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_mmap_gtt@bad-object (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][28] ([i915#4077])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_wc@pf-nonblock (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][29] ([i915#4083])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-14/igt@gem_mmap_wc@pf-nonblock.html

  * igt@i915_query@test-query-geometry-subslices (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][30] ([i915#5723])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@i915_query@test-query-geometry-subslices.html
    - {shard-tglu-10}:    NOTRUN -> [SKIP][31] ([i915#5723])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][32] ([i915#3689] / [i915#6095])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-18/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
    - {shard-tglu-9}:     NOTRUN -> [SKIP][33] ([i915#1845] / [i915#7651]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-9/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#2346])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#79]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt (NEW):
    - {shard-tglu}:       [SKIP][38] ([i915#1849]) -> [SKIP][39] ([fdo#109280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt (NEW):
    - {shard-rkl}:        [SKIP][40] ([fdo#111825]) -> [SKIP][41] ([i915#1849] / [i915#4098])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][42] ([i915#4833]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][43] ([i915#1849])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271]) +9 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][45] ([fdo#109280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4 (NEW):
    - {shard-rkl}:        [SKIP][46] ([i915#5439]) -> [SKIP][47] ([i915#1849] / [i915#4098])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][48] ([fdo#110189])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271]) +27 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-1.html

  * {igt@perf@gen12-invalid-class-instance} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl4/igt@perf@gen12-invalid-class-instance.html

  * igt@sysfs_heartbeat_interval@precise@rcs0 (NEW):
    - {shard-dg1}:        NOTRUN -> [FAIL][51] ([i915#1755]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][52] ([i915#7742]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html

  * igt@drm_read@empty-nonblock:
    - {shard-rkl}:        [SKIP][54] ([i915#1845] / [i915#4098]) -> [PASS][55] +14 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@drm_read@empty-nonblock.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@drm_read@empty-nonblock.html

  * igt@gem_ctx_persistence@hang:
    - {shard-rkl}:        [SKIP][56] ([i915#6252]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-5/igt@gem_ctx_persistence@hang.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-4/igt@gem_ctx_persistence@hang.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][58] ([i915#2846]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-rkl}:        [FAIL][60] ([i915#2842]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][62] ([i915#2842]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][64] ([i915#2842]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - {shard-rkl}:        [SKIP][66] ([i915#3281]) -> [PASS][67] +6 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-active.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - {shard-rkl}:        [SKIP][68] ([i915#3282]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gen9_exec_parse@bb-secure:
    - {shard-rkl}:        [SKIP][70] ([i915#2527]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-3/igt@gen9_exec_parse@bb-secure.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-rkl}:        [SKIP][72] ([i915#1397]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-5/igt@i915_pm_rpm@dpms-lpsp.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][74] ([i915#4387]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@i915_pm_sseu@full-enable.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][76] ([i915#79]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - {shard-tglu}:       [SKIP][78] ([i915#1849]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][80] ([i915#1849] / [i915#4098]) -> [PASS][81] +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - {shard-tglu}:       [SKIP][82] ([i915#1849] / [i915#3558]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_plane@pixel-format@pipe-b-planes.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-1/igt@kms_plane@pixel-format@pipe-b-planes.html

  * igt@kms_psr@sprite_mmap_gtt:
    - {shard-rkl}:        [SKIP][84] ([i915#1072]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@kms_psr@sprite_mmap_gtt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - {shard-tglu}:       [SKIP][86] ([i915#1845] / [i915#7651]) -> [PASS][87] +4 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_rotation_crc@bad-pixel-format.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][88] ([i915#1722]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-1/igt@perf@polling-small-buf.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@perf@polling-small-buf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5431]: https://gitlab.freedesktop.org/drm/intel/issues/5431
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7160 -> IGTPW_8498

  CI-20190529: 20190529
  CI_DRM_12739: 5fc904286af94038fbf2c7cda50ed871b70cf4e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8498: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html
  IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html

--===============7534382430419786144==
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
<tr><td><b>Series:</b></td><td>Enable OAM support in IGT and GPUvis (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114023/">https://patchwork.freedesktop.org/series/114023/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12739_full -&gt; IGTPW_8498_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8498_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8498_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8498_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-internal-1us:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-snb7/igt@gem_eio@in-flight-internal-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-snb4/igt@gem_eio@in-flight-internal-1us.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-apl1/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl4/igt@gem_eio@in-flight-suspend.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-y.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@perf@enable-disable@0-rcs0} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@perf@enable-disable@0-rcs0.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-16/igt@perf@enable-disable@0-rcs0.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl1/igt@perf@enable-disable@0-rcs0.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-1/igt@perf@enable-disable@0-rcs0.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk5/igt@perf@enable-disable@0-rcs0.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@perf@gen12-gt-concurrent-oa-buffer-read} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-4/igt@perf@gen12-gt-concurrent-oa-buffer-read.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@gen12-gt-exclusive-stream-ctx-handle} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@perf@gen12-gt-exclusive-stream-ctx-handle.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@gen12-gt-exclusive-stream-sample-oa} (NEW):</p>
<ul>
<li>{shard-tglu-10}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-10/igt@perf@gen12-gt-exclusive-stream-sample-oa.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@perf@global-sseu-config-invalid@0-rcs0} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-6/igt@perf@global-sseu-config-invalid@0-rcs0.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@perf@non-zero-reason@0-rcs0} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk3/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a></p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a></p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-18/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl2/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a></p>
</li>
<li>
<p>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-9/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane_scaling@invalid-parameters}:<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-1/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12739_full and IGTPW_8498_full:</p>
<h3>New IGT tests (280)</h3>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@basics:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@clean:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@clean@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@clean@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@clean@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@clean@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@clean@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-create:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-create@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-create@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-create@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-create@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-create@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@dirty-switch@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv-switch@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv-switch@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv-switch@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv-switch@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-shared-gtt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-shared-gtt@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-shared-gtt@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-shared-gtt@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-shared-gtt@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-shared-gtt@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-single-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-single-timeline@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-single-timeline@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-single-timeline@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-single-timeline@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@exec-single-timeline@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-independent:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-independent@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-independent@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-independent@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-out-order:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-out-order@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-out-order@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-out-order@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-out-order@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-out-order@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@pf-nonblock:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@oob-read:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_watchdog@default-physical:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_watchdog@default-virtual:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic_implicit_crtc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor_implicit_plane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc_implicit_plane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@blocking@0-rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill@0-rcs0:</p>
<ul>
<li>Statuses : 4 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>Statuses : 5 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-gt-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-gt-exclusive-stream-ctx-handle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-gt-exclusive-stream-sample-oa:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-invalid-class-instance:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate@0-rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid@0-rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config@0-rcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents@0-rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@oa-formats@0-rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_forked_cpu_write@test_forked_cpu_write-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@idempotent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@idempotent@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@idempotent@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@idempotent@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@idempotent@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@invalid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@invalid@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@invalid@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@invalid@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@invalid@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@invalid@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8498_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-idle (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@drm_fdinfo@busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5563">i915#5563</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0 (NEW):</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@gem_mmap_gtt@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-14/igt@gem_mmap_wc@pf-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices (NEW):</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5723">i915#5723</a>)</p>
</li>
<li>
<p>{shard-tglu-10}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5723">i915#5723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs (NEW):</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-18/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
<li>
<p>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-9/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4833">i915#4833</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4 (NEW):</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>{igt@perf@gen12-invalid-class-instance} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl4/igt@perf@gen12-invalid-class-instance.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0 (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@drm_read@empty-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@drm_read@empty-nonblock.html">PASS</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-4/igt@gem_ctx_persistence@hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-3/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-5/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_plane@pixel-format@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3558">i915#3558</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-1/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-2/igt@kms_psr@sprite_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-tglu-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-tglu-2/igt@kms_rotation_crc@bad-pixel-format.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12739/shard-rkl-1/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/shard-rkl-5/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7160 -&gt; IGTPW_8498</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12739: 5fc904286af94038fbf2c7cda50ed871b70cf4e8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8498: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8498/index.html<br />
  IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7534382430419786144==--
