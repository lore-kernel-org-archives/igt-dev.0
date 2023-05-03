Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0792848149859127710=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 03 May 2023 09:28:34 -0000
Message-ID: <168310611426.9282.5495367825195679006@emeril.freedesktop.org>
References: <20230503083907.2794598-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230503083907.2794598-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTmV3IGRp?=
 =?utf-8?q?r_structure_for_intel_specific_tests?=
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

--===============0792848149859127710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New dir structure for intel specific tests
URL   : https://patchwork.freedesktop.org/series/117227/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13101 -> IGTPW_8902
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8902:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_gem_exec_suspend@basic-s3@smem} (NEW):
    - bat-rpls-1:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rpls-1/igt@i915_gem_exec_suspend@basic-s3@smem.html

  * {igt@i915_gem_lmem_swapping@basic} (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][2] +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html
    - bat-rpls-1:         NOTRUN -> [SKIP][3] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html
    - bat-adlp-6:         NOTRUN -> [SKIP][4] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adlp-6/igt@i915_gem_lmem_swapping@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html
    - bat-adls-5:         NOTRUN -> [SKIP][6] +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html

  * {igt@i915_gem_lmem_swapping@parallel-random-engines} (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][7] +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adln-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - bat-adlm-1:         NOTRUN -> [SKIP][8] +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adlm-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - bat-rplp-1:         NOTRUN -> [SKIP][9] +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rplp-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * {igt@i915_gem_lmem_swapping@random-engines} (NEW):
    - {bat-mtlp-6}:       NOTRUN -> [SKIP][11] +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-6/igt@i915_gem_lmem_swapping@random-engines.html

  * {igt@i915_gem_lmem_swapping@verify-random} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][12] +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-jsl-3/igt@i915_gem_lmem_swapping@verify-random.html

  * {igt@i915_gem_mmap@basic} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-7/igt@i915_gem_mmap@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][14] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-11/igt@i915_gem_mmap@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-9/igt@i915_gem_mmap@basic.html

  * {igt@i915_gem_render_tiled_blits@basic} (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][17] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][18] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-8/igt@i915_gem_render_tiled_blits@basic.html

  * {igt@i915_gem_tiled_pread_basic} (NEW):
    - {bat-mtlp-8}:       NOTRUN -> [SKIP][19] +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-8/igt@i915_gem_tiled_pread_basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13101 and IGTPW_8902:

### New IGT tests (113) ###

  * igt@i915_gem_basic@bad-close:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-close:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-fd-close:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@all-engines:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-process:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-threads:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic:
    - Statuses : 36 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic-files:
    - Statuses : 36 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic:
    - Statuses : 36 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-smem:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs1-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs1-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs2-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs2-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs3-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs3-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-smem:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-smem:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-smem:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-smem:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@smem:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@bcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@rcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs1:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@bcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@rcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs1:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@bcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@rcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs1:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@bcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@rcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs1:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@basic:
    - Statuses : 35 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@basic:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@contexts:
    - Statuses : 36 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@fds:
    - Statuses : 34 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@userptr:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_store@basic:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s0@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0@smem:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s3@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3@smem:
    - Statuses : 1 abort(s) 32 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-flink:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-open:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@basic:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@double-flink:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@flink-lifetime:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_huc_copy@huc-copy:
    - Statuses : 16 pass(s) 21 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_linear_blits@basic:
    - Statuses : 35 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random@lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap@basic:
    - Statuses : 29 pass(s) 8 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap_gtt@basic:
    - Statuses : 29 pass(s) 8 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_linear_blits@basic:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_tiled_blits@basic:
    - Statuses : 29 pass(s) 8 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ringfill@basic-all:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic:
    - Statuses : 32 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic-reserve:
    - Statuses : 32 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@safe-alignment:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-all:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-each:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_blits@basic:
    - Statuses : 27 pass(s) 10 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_fence_blits@basic:
    - Statuses : 29 pass(s) 8 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_pread_basic:
    - Statuses : 22 pass(s) 15 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@busy@all-engines:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@wait@all-engines:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8902 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@i915_gem_exec_parallel@engines@fds} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][20] ([fdo#109271]) +7 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html
    - fi-ilk-650:         NOTRUN -> [SKIP][21] ([fdo#109271]) +7 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-ilk-650/igt@i915_gem_exec_parallel@engines@fds.html

  * {igt@i915_gem_huc_copy@huc-copy} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][22] ([fdo#109271]) +6 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-hsw-4770/igt@i915_gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-8809g/igt@i915_gem_huc_copy@huc-copy.html

  * {igt@i915_gem_lmem_swapping@basic} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][24] ([fdo#109271]) +11 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-blb-e6850/igt@i915_gem_lmem_swapping@basic.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][25] ([fdo#109271]) +7 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-bsw-n3050/igt@i915_gem_lmem_swapping@basic.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][26] ([fdo#109271]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-kbl-2/igt@i915_gem_lmem_swapping@basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][27] ([fdo#109271]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-skl-6600u/igt@i915_gem_lmem_swapping@basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][28] ([fdo#109271]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-apl-guc/igt@i915_gem_lmem_swapping@basic.html

  * {igt@i915_gem_lmem_swapping@parallel-random-engines} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-skl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][30] ([fdo#109271]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][31] ([fdo#109271]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][32] ([fdo#109271]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-7567u/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][33] ([fdo#109271]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-ivb-3770/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][34] ([fdo#109271]) +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-bsw-nick/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * {igt@i915_gem_lmem_swapping@random-engines} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html

  * {igt@i915_gem_lmem_swapping@verify-random} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][37] ([fdo#109271]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][38] ([fdo#109271]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-cfl-8700k/igt@i915_gem_lmem_swapping@verify-random.html

  * {igt@i915_gem_mmap_gtt@basic} (NEW):
    - {bat-mtlp-8}:       NOTRUN -> [SKIP][39] ([i915#4077]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-8/igt@i915_gem_mmap_gtt@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][40] ([i915#4077]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-8/igt@i915_gem_mmap_gtt@basic.html

  * {igt@i915_gem_tiled_blits@basic} (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][41] ([i915#4077]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-5/igt@i915_gem_tiled_blits@basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][42] ([i915#4077]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-7/igt@i915_gem_tiled_blits@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][43] ([i915#4077]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][44] ([i915#4077]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html
    - {bat-mtlp-6}:       NOTRUN -> [SKIP][45] ([i915#4077]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-6/igt@i915_gem_tiled_blits@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][46] ([i915#4077]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-9/igt@i915_gem_tiled_blits@basic.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [PASS][47] -> [DMESG-WARN][48] ([i915#7699])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13101/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-11/igt@i915_selftest@live@migrate.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         [DMESG-WARN][49] ([i915#6367]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13101/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7277 -> IGTPW_8902

  CI-20190529: 20190529
  CI_DRM_13101: d540ae42e72fbf5f399ce138ef7c895eb08e3ca7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 59576 lines
--- 59577 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html

--===============0792848149859127710==
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
<tr><td><b>Series:</b></td><td>New dir structure for intel specific tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117227/">https://patchwork.freedesktop.org/series/117227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13101 -&gt; IGTPW_8902</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8902:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_gem_exec_suspend@basic-s3@smem} (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rpls-1/igt@i915_gem_exec_suspend@basic-s3@smem.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@basic} (NEW):</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adlp-6/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +5 similar issues</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@parallel-random-engines} (NEW):</p>
<ul>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adln-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-adlm-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rplp-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@random-engines} (NEW):</p>
<ul>
<li>{bat-mtlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-6/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@verify-random} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-jsl-3/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_mmap@basic} (NEW):</p>
<ul>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-7/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-11/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-9/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_render_tiled_blits@basic} (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-8/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_tiled_pread_basic} (NEW):</p>
<ul>
<li>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-8/igt@i915_gem_tiled_pread_basic.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13101 and IGTPW_8902:</p>
<h3>New IGT tests (113)</h3>
<ul>
<li>
<p>igt@i915_gem_basic@bad-close:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-close:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-fd-close:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@all-engines:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-process:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-threads:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic:</p>
<ul>
<li>Statuses : 36 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic-files:</p>
<ul>
<li>Statuses : 36 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic:</p>
<ul>
<li>Statuses : 36 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-smem:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs0-smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs1-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs1-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs2-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs2-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs3-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs3-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-smem:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-smem:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-smem:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-smem:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs1-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs1-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@smem:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@basic:</p>
<ul>
<li>Statuses : 35 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 36 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 34 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@userptr:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_store@basic:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>Statuses : 1 abort(s) 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-flink:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-open:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@basic:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@double-flink:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@flink-lifetime:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_huc_copy@huc-copy:</p>
<ul>
<li>Statuses : 16 pass(s) 21 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_linear_blits@basic:</p>
<ul>
<li>Statuses : 35 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random@lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap@basic:</p>
<ul>
<li>Statuses : 29 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap_gtt@basic:</p>
<ul>
<li>Statuses : 29 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_linear_blits@basic:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic:</p>
<ul>
<li>Statuses : 29 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ringfill@basic-all:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 32 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 32 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@safe-alignment:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-all:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-each:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic:</p>
<ul>
<li>Statuses : 27 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_fence_blits@basic:</p>
<ul>
<li>Statuses : 29 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic:</p>
<ul>
<li>Statuses : 22 pass(s) 15 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@busy@all-engines:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@wait@all-engines:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8902 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@i915_gem_exec_parallel@engines@fds} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-ilk-650/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_huc_copy@huc-copy} (NEW):</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-hsw-4770/igt@i915_gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-8809g/igt@i915_gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@basic} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-blb-e6850/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-bsw-n3050/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-kbl-2/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-skl-6600u/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-apl-guc/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@parallel-random-engines} (NEW):</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-skl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-7567u/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-ivb-3770/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-bsw-nick/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@random-engines} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@verify-random} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/fi-cfl-8700k/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_mmap_gtt@basic} (NEW):</p>
<ul>
<li>
<p>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-8/igt@i915_gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-8/igt@i915_gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_tiled_blits@basic} (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-5/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg1-7/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>{bat-mtlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-mtlp-6/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-9/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13101/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13101/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7277 -&gt; IGTPW_8902</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13101: d540ae42e72fbf5f399ce138ef7c895eb08e3ca7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8902/index.html<br />
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 59576 lines<br />
--- 59577 lines</p>

</body>
</html>

--===============0792848149859127710==--
