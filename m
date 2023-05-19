Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0420668506281988342=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 19 May 2023 03:54:45 -0000
Message-ID: <168446848521.26991.16326300779057359966@emeril.freedesktop.org>
References: <20230518151842.287294-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230518151842.287294-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgTmV3IGRp?=
 =?utf-8?q?r_structure_for_intel_specific_tests_=28rev2=29?=
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

--===============0420668506281988342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New dir structure for intel specific tests (rev2)
URL   : https://patchwork.freedesktop.org/series/117227/
State : success

== Summary ==

CI Bug Log - changes from IGT_7296_full -> IGTPW_8999_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8999_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_api_intel_bb@crc32} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1] +219 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-rkl-3/igt@i915_api_intel_bb@crc32.html

  * {igt@i915_gem_ctx_persistence@heartbeat-close} (NEW):
    - {shard-dg1}:        NOTRUN -> [FAIL][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-18/igt@i915_gem_ctx_persistence@heartbeat-close.html

  * {igt@i915_gem_eio@hibernate} (NEW):
    - {shard-rkl}:        NOTRUN -> [ABORT][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-rkl-4/igt@i915_gem_eio@hibernate.html
    - {shard-tglu}:       NOTRUN -> [ABORT][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-10/igt@i915_gem_eio@hibernate.html

  * {igt@i915_gem_eio@unwedge-stress} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-snb5/igt@i915_gem_eio@unwedge-stress.html

  * {igt@i915_gem_exec_fair@basic-none-share@rcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +10 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-glk8/igt@i915_gem_exec_fair@basic-none-share@rcs0.html

  * {igt@i915_gem_exec_fair@basic-none@vcs0} (NEW):
    - {shard-tglu}:       NOTRUN -> [FAIL][7] +19 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-7/igt@i915_gem_exec_fair@basic-none@vcs0.html

  * {igt@i915_gem_exec_schedule@reorder-wide} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][8] +323 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-14/igt@i915_gem_exec_schedule@reorder-wide.html

  * {igt@i915_gem_lmem_evict@dontneed-evict-race} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][9] +116 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-8/igt@i915_gem_lmem_evict@dontneed-evict-race.html

  * {igt@i915_gem_lmem_swapping@smem-oom@lmem0} (NEW):
    - {shard-dg1}:        NOTRUN -> [DMESG-WARN][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-16/igt@i915_gem_lmem_swapping@smem-oom@lmem0.html

  * {igt@i915_gem_pread@exhaustion} (NEW):
    - {shard-tglu}:       NOTRUN -> [WARN][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-10/igt@i915_gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-glk7/igt@i915_gem_pread@exhaustion.html

  * {igt@i915_gem_pwrite@basic-exhaustion} (NEW):
    - shard-apl:          NOTRUN -> [WARN][13] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-apl6/igt@i915_gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-snb5/igt@i915_gem_pwrite@basic-exhaustion.html

  * {igt@i915_gem_userptr_blits@vma-merge} (NEW):
    - {shard-rkl}:        NOTRUN -> [FAIL][15] +15 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-rkl-1/igt@i915_gem_userptr_blits@vma-merge.html
    - shard-apl:          NOTRUN -> [FAIL][16] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-apl3/igt@i915_gem_userptr_blits@vma-merge.html

  * {igt@i915_gen9_exec_parse@allowed-single} (NEW):
    - shard-apl:          NOTRUN -> [ABORT][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-apl6/igt@i915_gen9_exec_parse@allowed-single.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - {shard-dg1}:        [PASS][18] -> [DMESG-WARN][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7296/shard-dg1-14/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-16/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  
New tests
---------

  New tests have been introduced between IGT_7296_full and IGTPW_8999_full:

### New IGT tests (2249) ###

  * igt@i915_api_intel_allocator@alloc-simple:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@default-alignment:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@execbuf-with-allocator:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@fork-simple-once:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@fork-simple-stress:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@fork-simple-stress-signal:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@gem-pool:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@open-vm:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reloc-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_api_intel_allocator@reloc-allocator@basic:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reloc-allocator@fork-reopen-allocator:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reloc-allocator@parallel-one:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reloc-allocator@print:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reloc-allocator@reuse:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reopen:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reopen-fork:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@reserve-simple:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@simple-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_api_intel_allocator@simple-allocator@basic:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@simple-allocator@fork-reopen-allocator:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@simple-allocator@parallel-one:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@simple-allocator@print:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@simple-allocator@reserve:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@simple-allocator@reuse:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@standalone:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@two-level-inception:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_allocator@two-level-inception-interruptible:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@add-remove-objects:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@bb-with-allocator:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@crc32:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@delta-check:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@destroy-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@full-batch:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@intel-bb-blit-none:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@intel-bb-blit-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@intel-bb-blit-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@lot-of-buffers:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@misplaced-blitter:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@object-noreloc-keep-cache-simple:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@object-noreloc-purge-cache-simple:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@object-reloc-keep-cache:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@object-reloc-purge-cache:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@offset-control:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@purge-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_api_intel_bb@render-ccs:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-none-1024:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-none-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-none-reloc-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-none-reloc-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-x-1024:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-x-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-x-reloc-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-x-reloc-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-y-1024:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-y-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-y-reloc-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@render@render-y-reloc-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@reset-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@reset-flags:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@simple-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_api_intel_bb@simple-bb-ctx:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@basics:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-check-all:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-check-all@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-check-all@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-check-all@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-check-all@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-check-all@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-hang:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-hang@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-hang@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-hang@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-hang@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle-check-all:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy-idle@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@busy@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@idle:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@idle@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@idle@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@idle@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@idle@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@idle@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@isolation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@isolation@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@isolation@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@isolation@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@isolation@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-check-all:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-check-all@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@bcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-busy:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-busy-all:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_drm_fdinfo@virtual-idle:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_bad_reloc@negative-reloc:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_bad_reloc@negative-reloc-bltcopy:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_bad_reloc@negative-reloc-lut:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_barrier_race@remote-request:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_barrier_race@remote-request@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@bad-close:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-close:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-fd-close:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@multigpu-create-close:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_blits@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_busy@busy@all-engines:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@close-race:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@extended:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_busy@extended@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@extended@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@extended@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@extended@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@extended@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@parallel:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_busy@parallel@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@parallel@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@parallel@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@parallel@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@parallel@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@semaphore:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@semaphore@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@semaphore@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@semaphore@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@semaphore@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@semaphore@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_caching@read-writes:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_caching@reads:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_caching@writes:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-compressed:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-lmem0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-lmem0-smem:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-smem-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-smem-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-lmem0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-lmem0-smem:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-smem-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-smem-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-multicopy-compressed:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@block-multicopy-inplace:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@ctrl-surf-copy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@ctrl-surf-copy-new-ctx:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ccs@suspend-resume:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close@many-handles-one-vma:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-process:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-threads:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@multigpu-basic-process:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@multigpu-basic-threads:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@busy-create:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_create@busy-create@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@busy-create@smem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-clear:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_create@create-clear@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-clear@smem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-ext-cpu-access-big:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-ext-cpu-access-sanity-check:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-ext-placement-all:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-ext-placement-each:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-ext-placement-sanity-check:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-invalid-size:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-massive:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-size-update:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@create-valid-nonaligned:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@hog-create:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_create@hog-create@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_create@hog-create@smem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_cs_tlb@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_cs_tlb@engines@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_cs_tlb@engines@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_cs_tlb@engines@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_cs_tlb@engines@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_cs_tlb@engines@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_bad_destroy@double-destroy:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_bad_destroy@invalid-ctx:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_bad_destroy@invalid-default-ctx:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_bad_destroy@invalid-pad:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic-files:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@execute-allforone:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@execute-one:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@execute-oneforall:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent@all-engines:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@invalid-engines:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_engines@none:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic-close-race:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic-invalid-context:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic-nohangcheck:
    - Statuses : 2 fail(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic-norecovery:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_freq@sysfs:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@clean:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@clean@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@clean@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@clean@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@clean@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@clean@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-create:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@dirty-create@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-create@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-create@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-create@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-create@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@dirty-switch@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-switch@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-switch@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-switch@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@dirty-switch@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@nonpriv-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@nonpriv-switch@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv-switch@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv-switch@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv-switch@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv-switch@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@nonpriv@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@preservation-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@preservation-reset@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-reset@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-reset@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-reset@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-reset@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_ctx_isolation@preservation-s3@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-s3@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-s3@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-s3@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation-s3@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_isolation@preservation@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@basic-default:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@get-priority-new-ctx:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-ctx-get:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-ctx-set:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-get-engines:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-get-no-zeromap:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-get-ringsize:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-param-get:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-param-set:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-set-no-zeromap:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-set-ringsize:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-size-get:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@invalid-size-set:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@non-root-set:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@root-set:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@set-priority-invalid-size:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@set-priority-not-supported:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@set-priority-range:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_param@vm:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-cleanup:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-cleanup@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-cleanup@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-cleanup@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-cleanup@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-cleanup@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hang:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hang@bcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hang@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hang@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hang@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hang@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile-preempt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile-preempt@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile-preempt@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile-preempt@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile-preempt@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile-preempt@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-hostile@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed-process:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed-process@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed-process@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed-process@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed-process@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed-process@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-mixed@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-persistence:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-persistence@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-persistence@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-persistence@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-persistence@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-persistence@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-queued:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-queued@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-queued@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-queued@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-queued@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@engines-queued@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@file:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@hang:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@heartbeat-close:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@heartbeat-hang:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@heartbeat-hostile:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@heartbeat-many:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@heartbeat-stop:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@hostile:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@idempotent:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-cleanup@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang@blt:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hang@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile@blt:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile@bsd:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile@bsd1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile@bsd2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile@render:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-hostile@vebox:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-mixed@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-persistence@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued@blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued@bsd:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued@bsd1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued@render:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@legacy-engines-queued@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@many-contexts:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@process:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@processes:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@saturated-hostile@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@smoketest:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_persistence@userptr:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@create-shared-gtt:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@detached-shared-gtt:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@disjoint-timelines:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-shared-gtt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-shared-gtt@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-shared-gtt@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-shared-gtt@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-shared-gtt@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-shared-gtt@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-single-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-single-timeline@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-single-timeline@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-single-timeline@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-single-timeline@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@exec-single-timeline@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-in-order:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-in-order@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-in-order@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-in-order@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-in-order@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-in-order@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-independent:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-independent@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-independent@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-independent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-out-order:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-out-order@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-out-order@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-out-order@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-out-order@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-out-order@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-promotion:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-promotion@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-promotion@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-promotion@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-promotion@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-promotion@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest-all:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@q-smoketest@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_shared@single-timeline:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_sseu@engines:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_sseu@invalid-args:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_sseu@invalid-sseu:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_sseu@mmap-args:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@banned:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@context-create:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@create:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@create-ext:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@execbuf:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@hibernate:
    - Statuses : 2 abort(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-10ms:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-1us:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-contexts-10ms:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-contexts-1us:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-contexts-immediate:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-external:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-immediate:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-internal-10ms:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-internal-1us:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-internal-immediate:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@in-flight-suspend:
    - Statuses : 1 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@kms:
    - Statuses : 1 fail(s) 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@reset-stress:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@suspend:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@throttle:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@unwedge-stress:
    - Statuses : 1 fail(s) 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@wait-10ms:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@wait-1us:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@wait-immediate:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@wait-wedge-10ms:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@wait-wedge-1us:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_eio@wait-wedge-immediate:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_alignment@forked:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_alignment@many:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_alignment@pi:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_alignment@pi-isolated:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_alignment@single:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_async@concurrent-writes:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_async@concurrent-writes@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@concurrent-writes@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@concurrent-writes@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@concurrent-writes@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@concurrent-writes@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@forked-writes:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_async@forked-writes@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@forked-writes@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@forked-writes@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@forked-writes@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_async@forked-writes@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_await@wide-all:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_await@wide-contexts:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-chain:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-dual:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-false-hang:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-pair:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-semaphore:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-sync:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@bonded-true-hang:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@busy:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@fairslice:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@full:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@full-late:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@full-late-pulse:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@full-pulse:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@hang:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@hog:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@indices:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@individual:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@invalid-balancer:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@invalid-bonds:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@nohangcheck:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@noheartbeat:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@nop:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-balancer:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-bb-first:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-contexts:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-keep-in-fence:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-keep-submit-fence:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-ordering:
    - Statuses : 1 fail(s) 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@parallel-out-fence:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@persistence:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@semaphore:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@sequential:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@sliced:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@smoke:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_balancer@waits:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_basic@basic@bcs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_big@single:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture-invisible:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture-invisible@lmem0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture-invisible@smem0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture-recoverable:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@bcs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@bcs0-smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@rcs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@rcs0-smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@vcs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@vcs0-smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@vcs1-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@vcs1-smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@vecs0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@capture@vecs0-smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@pi:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@pi@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@pi@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@pi@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@pi@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@pi@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_capture@userptr:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_create@basic@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@forked:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_create@forked@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@forked@smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_create@legacy@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@legacy@smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@madvise:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_create@madvise@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@madvise@smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_endless@dispatch:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_endless@dispatch@bcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_endless@dispatch@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_endless@dispatch@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_endless@dispatch@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_endless@dispatch@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-deadline:
    - Statuses : 2 fail(s) 2 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-flow@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-rrul@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-share@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-solo@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none-vip@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none@bcs0:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none@vcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-none@vecs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace-share@rcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace-solo@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace@bcs0:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace@rcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace@vcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-pace@vecs0:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-sync@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fair@basic-throttle@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy-all:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait-all:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@concurrent:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@concurrent@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@concurrent@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@concurrent@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@concurrent@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@concurrent@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@expired-history:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@invalid-fence-array:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@invalid-timeline-fence-array:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@keep-in-fence:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@keep-in-fence@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@keep-in-fence@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@keep-in-fence@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@keep-in-fence@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@keep-in-fence@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@long-history:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@parallel:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@parallel@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@parallel@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@parallel@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@parallel@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@parallel@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit-chain:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit3@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit3@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit3@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit3@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit3@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit67:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit67@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit67@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit67@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit67@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit67@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@submit@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-channel:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-export:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-import:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-invalid-flags:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-invalid-wait:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-repeat:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-signal:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-stationary-timeline-chain-engines:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-chain-engines:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-export:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-invalid-flags:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-invalid-wait:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-multiple-ext-nodes:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-repeat:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-signal:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-unused-fence:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-timeline-wait:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-unused-fence:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@syncobj-wait:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-batch-kernel-default-cmd:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-batch-kernel-default-uc:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-batch-kernel-default-wb:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-uc-pro-default:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-uc-prw-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-uc-ro-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-uc-rw-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-uc-set-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-pro-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-prw-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-ro-before-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-ro-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-rw-before-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-rw-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_flush@basic-wb-set-default:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@all-engines:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_gttfill@engines@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@engines@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@engines@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@engines@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@engines@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@multigpu-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_nop@basic-parallel:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_nop@basic-sequential:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_nop@basic-series:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@basic@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@basic@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@basic@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@basic@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@basic@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@contexts:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@contexts@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@contexts@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@contexts@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@contexts@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@contexts@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@engines@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@contexts:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@fds:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@userptr:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@fds:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@fds@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@fds@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@fds@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@fds@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@fds@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@userptr@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@userptr@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@userptr@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@userptr@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@userptr@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@batch-first:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@cliprects-invalid:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@cliprects_ptr-dirt:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@dr1-dirt:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@dr4-dirt:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-batch-start-offset:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd-ring:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd1-flag-on-blt:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd1-flag-on-render:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd1-flag-on-vebox:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd2-flag-on-blt:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd2-flag-on-render:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-bsd2-flag-on-vebox:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-fence-in:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-fence-in-submit:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-flag:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-ring:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@invalid-ring2:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@larger-than-life-batch:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@mmapped:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@no-blt:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@no-bsd:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@no-vebox:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@readonly:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@rel-constants-invalid:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@rel-constants-invalid-rel-gen5:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@rel-constants-invalid-ring:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@rs-invalid:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@rsvd2-dirt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@secure-non-master:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@secure-non-root:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@sol-reset-invalid:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_params@sol-reset-not-gen7:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active@all-engines:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-active@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-concurrent0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-concurrent16:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-gtt:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-gtt-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-gtt-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-read:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-read-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-read-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-wc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-wc-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-cpu-wc-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-cpu:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-cpu-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-cpu-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-read:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-read-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-read-noreloc:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-wc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-wc-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-gtt-wc-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-range:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-range-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-scanout:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-scanout@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-scanout@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-scanout@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-scanout@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-scanout@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-softpin:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-cpu:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-cpu-active:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-cpu-noreloc:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-gtt:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-gtt-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-gtt-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-read:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-read-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-wc-read-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-cpu:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-cpu-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-cpu-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-gtt:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-gtt-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-gtt-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-read:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-read-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-read-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-wc:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-wc-active:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_reloc@basic-write-wc-noreloc:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@deep:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@deep@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@deep@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@deep@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@deep@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@deep@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice-all:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fifo:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_schedule@fifo@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fifo@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fifo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fifo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@fifo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-boths:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_schedule@implicit-boths@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-boths@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-boths@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-boths@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-boths@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-read-write:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_schedule@implicit-read-write@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-read-write@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-read-write@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_schedule@implicit-read-write@vcs1:
    - Statuses : 2 pass(s)

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/index.html

--===============0420668506281988342==
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
<tr><td><b>Series:</b></td><td>New dir structure for intel specific tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117227/">https://patchwork.freedesktop.org/series/117227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7296_full -&gt; IGTPW_8999_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8999_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_api_intel_bb@crc32} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-rkl-3/igt@i915_api_intel_bb@crc32.html">SKIP</a> +219 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_ctx_persistence@heartbeat-close} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-18/igt@i915_gem_ctx_persistence@heartbeat-close.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_eio@hibernate} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-rkl-4/igt@i915_gem_eio@hibernate.html">ABORT</a> +1 similar issue</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-10/igt@i915_gem_eio@hibernate.html">ABORT</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_eio@unwedge-stress} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-snb5/igt@i915_gem_eio@unwedge-stress.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_exec_fair@basic-none-share@rcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-glk8/igt@i915_gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_exec_fair@basic-none@vcs0} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-7/igt@i915_gem_exec_fair@basic-none@vcs0.html">FAIL</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_exec_schedule@reorder-wide} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-14/igt@i915_gem_exec_schedule@reorder-wide.html">SKIP</a> +323 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_evict@dontneed-evict-race} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-8/igt@i915_gem_lmem_evict@dontneed-evict-race.html">SKIP</a> +116 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_lmem_swapping@smem-oom@lmem0} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-16/igt@i915_gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_pread@exhaustion} (NEW):</p>
<ul>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-tglu-10/igt@i915_gem_pread@exhaustion.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-glk7/igt@i915_gem_pread@exhaustion.html">WARN</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_pwrite@basic-exhaustion} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-apl6/igt@i915_gem_pwrite@basic-exhaustion.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-snb5/igt@i915_gem_pwrite@basic-exhaustion.html">WARN</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gem_userptr_blits@vma-merge} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-rkl-1/igt@i915_gem_userptr_blits@vma-merge.html">FAIL</a> +15 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-apl3/igt@i915_gem_userptr_blits@vma-merge.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_gen9_exec_parse@allowed-single} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-apl6/igt@i915_gen9_exec_parse@allowed-single.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7296/shard-dg1-14/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8999/shard-dg1-16/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7296_full and IGTPW_8999_full:</p>
<h3>New IGT tests (2249)</h3>
<ul>
<li>
<p>igt@i915_api_intel_allocator@alloc-simple:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@default-alignment:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@fork-simple-once:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@fork-simple-stress:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@gem-pool:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@open-vm:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reloc-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reloc-allocator@basic:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reloc-allocator@fork-reopen-allocator:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reloc-allocator@parallel-one:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reloc-allocator@print:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reloc-allocator@reuse:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reopen:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reopen-fork:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@reserve-simple:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator@basic:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator@fork-reopen-allocator:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator@parallel-one:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator@print:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator@reserve:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@simple-allocator@reuse:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@standalone:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@two-level-inception:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@add-remove-objects:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@bb-with-allocator:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@crc32:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@delta-check:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@destroy-bb:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@full-batch:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@intel-bb-blit-none:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@lot-of-buffers:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@misplaced-blitter:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@object-noreloc-keep-cache-simple:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@object-noreloc-purge-cache-simple:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@offset-control:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@purge-bb:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-none-1024:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-none-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-none-reloc-1024:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-none-reloc-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-x-1024:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-x-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-x-reloc-1024:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-x-reloc-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-y-1024:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-y-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-y-reloc-1024:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@render@render-y-reloc-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@reset-bb:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@reset-flags:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@simple-bb:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_api_intel_bb@simple-bb-ctx:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@basics:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-idle:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_bad_reloc@negative-reloc:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_barrier_race@remote-request:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@bad-close:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-close:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-fd-close:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@multigpu-create-close:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_blits@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@all-engines:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@close-race:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@extended:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@extended@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@extended@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@extended@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@extended@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@extended@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@parallel:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@parallel@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@parallel@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@parallel@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@parallel@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@parallel@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@semaphore:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@semaphore@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@semaphore@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@semaphore@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@semaphore@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@semaphore@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_caching@read-writes:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_caching@reads:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_caching@writes:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-compressed:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-lmem0-smem:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-smem-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-smem-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-lmem0-smem:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-smem-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-copy-uncompressed@ymajor-uncompressed-compfmt0-smem-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ccs@suspend-resume:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close@many-handles-one-vma:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-process:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-threads:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@multigpu-basic-process:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@busy-create:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@busy-create@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@busy-create@smem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-clear:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-clear@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-clear@smem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-ext-placement-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-ext-placement-each:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-ext-placement-sanity-check:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-invalid-size:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-massive:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-size-update:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@create-valid-nonaligned:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@hog-create:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@hog-create@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_create@hog-create@smem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_cs_tlb@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_cs_tlb@engines@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_cs_tlb@engines@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_cs_tlb@engines@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_cs_tlb@engines@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_cs_tlb@engines@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_bad_destroy@double-destroy:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_bad_destroy@invalid-ctx:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_bad_destroy@invalid-default-ctx:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_bad_destroy@invalid-pad:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic-files:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@execute-allforone:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@execute-one:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@execute-oneforall:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent@all-engines:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@invalid-engines:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_engines@none:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic-close-race:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic-invalid-context:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>Statuses : 2 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic-norecovery:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_freq@sysfs:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@clean:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@clean@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@clean@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@clean@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@clean@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@clean@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-create:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-create@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-create@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-create@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-create@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-create@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-switch@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-switch@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-switch@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-switch@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@dirty-switch@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv-switch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv-switch@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv-switch@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv-switch@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv-switch@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv-switch@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@nonpriv@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-reset@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-reset@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-reset@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-reset@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-reset@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_isolation@preservation@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@basic-default:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@get-priority-new-ctx:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-ctx-get:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-ctx-set:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-get-engines:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-get-no-zeromap:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-get-ringsize:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-param-get:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-param-set:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-set-no-zeromap:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-set-ringsize:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-size-get:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@invalid-size-set:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@non-root-set:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@root-set:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@set-priority-invalid-size:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@set-priority-range:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_param@vm:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-cleanup@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-cleanup@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-cleanup@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-cleanup@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-cleanup@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hang:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hang@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hang@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hang@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile-preempt@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile-preempt@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile-preempt@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile-preempt@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile-preempt@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-hostile@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed-process@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed-process@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed-process@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed-process@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed-process@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-mixed@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-persistence@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-persistence@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-persistence@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-persistence@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-persistence@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-queued:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-queued@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-queued@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-queued@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-queued@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@engines-queued@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@file:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@hang:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@hostile:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@idempotent:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup@blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-cleanup@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hang@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile-preempt@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile@blt:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile@bsd:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile@bsd1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile@bsd2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile@render:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed-process@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed@blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-mixed@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence@blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-persistence@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued@blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued@bsd:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued@bsd1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued@render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@legacy-engines-queued@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@many-contexts:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@process:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@processes:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile-nopreempt@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@smoketest:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_persistence@userptr:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@create-shared-gtt:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@detached-shared-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@disjoint-timelines:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-shared-gtt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-shared-gtt@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-shared-gtt@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-shared-gtt@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-shared-gtt@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-shared-gtt@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-single-timeline:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-single-timeline@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-single-timeline@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-single-timeline@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-single-timeline@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@exec-single-timeline@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-in-order:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-in-order@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-in-order@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-in-order@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-in-order@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-in-order@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-independent:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-independent@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-independent@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-independent@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-out-order:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-out-order@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-out-order@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-out-order@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-out-order@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-out-order@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-promotion:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-promotion@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-promotion@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-promotion@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-promotion@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-promotion@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@q-smoketest@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_shared@single-timeline:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_sseu@engines:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_sseu@invalid-args:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_sseu@mmap-args:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@banned:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@context-create:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@create:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@create-ext:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@execbuf:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@hibernate:</p>
<ul>
<li>Statuses : 2 abort(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-10ms:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-1us:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-external:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-immediate:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-internal-10ms:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-internal-1us:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@in-flight-suspend:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@kms:</p>
<ul>
<li>Statuses : 1 fail(s) 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@reset-stress:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@suspend:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@throttle:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@unwedge-stress:</p>
<ul>
<li>Statuses : 1 fail(s) 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@wait-10ms:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@wait-1us:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@wait-immediate:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@wait-wedge-10ms:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@wait-wedge-1us:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_eio@wait-wedge-immediate:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_alignment@forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_alignment@many:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_alignment@pi:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_alignment@pi-isolated:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_alignment@single:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@concurrent-writes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@concurrent-writes@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@concurrent-writes@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@concurrent-writes@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@concurrent-writes@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@concurrent-writes@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@forked-writes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@forked-writes@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@forked-writes@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@forked-writes@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@forked-writes@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_async@forked-writes@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_await@wide-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_await@wide-contexts:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-chain:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-dual:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-pair:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-sync:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@busy:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@fairslice:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@full:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@full-late:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@full-late-pulse:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@full-pulse:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@hang:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@hog:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@indices:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@individual:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@invalid-balancer:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@nohangcheck:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@noheartbeat:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@nop:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@persistence:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@semaphore:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@sequential:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@sliced:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@smoke:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_balancer@waits:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_big@single:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture-invisible:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture-recoverable:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@bcs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@bcs0-smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@rcs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@rcs0-smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@vcs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@vcs0-smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@vcs1-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@vcs1-smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@capture@vecs0-smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@pi:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@pi@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@pi@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@pi@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@pi@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@pi@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_capture@userptr:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@forked@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@forked@smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@legacy@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@legacy@smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@madvise:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@madvise@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@madvise@smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_endless@dispatch:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-deadline:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-flow:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-vip:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-sync:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-throttle:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@concurrent:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@concurrent@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@concurrent@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@concurrent@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@concurrent@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@concurrent@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@expired-history:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@invalid-fence-array:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@invalid-timeline-fence-array:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@keep-in-fence:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@keep-in-fence@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@keep-in-fence@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@keep-in-fence@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@keep-in-fence@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@keep-in-fence@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@long-history:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@parallel:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@parallel@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@parallel@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@parallel@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@parallel@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit-chain:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit3@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit3@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit3@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit3@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit3@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit67:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit67@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit67@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit67@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit67@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit67@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@submit@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-channel:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-export:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-import:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-invalid-flags:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-invalid-wait:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-repeat:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-signal:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-stationary-timeline-chain-engines:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-chain-engines:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-export:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-invalid-flags:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-invalid-wait:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-multiple-ext-nodes:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-repeat:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-signal:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-unused-fence:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-timeline-wait:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-unused-fence:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@syncobj-wait:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@all-engines:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@engines@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@engines@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@engines@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@engines@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_nop@basic-parallel:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_nop@basic-sequential:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_nop@basic-series:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@basic@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@basic@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@basic@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@basic@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@basic@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@contexts:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@contexts@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@contexts@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@contexts@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@contexts@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@contexts@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@userptr:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@fds:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@fds@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@fds@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@fds@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@fds@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@fds@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@userptr@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@userptr@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@userptr@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@userptr@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@userptr@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@batch-first:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@cliprects-invalid:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@cliprects_ptr-dirt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@dr1-dirt:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@dr4-dirt:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-batch-start-offset:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd-ring:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd1-flag-on-blt:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd1-flag-on-render:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd1-flag-on-vebox:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd2-flag-on-blt:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd2-flag-on-render:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-bsd2-flag-on-vebox:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-fence-in:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-fence-in-submit:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-flag:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-ring:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@invalid-ring2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@mmapped:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@no-blt:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@no-bsd:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@no-vebox:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@readonly:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@rel-constants-invalid:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@rel-constants-invalid-rel-gen5:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@rel-constants-invalid-ring:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@rs-invalid:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@secure-non-master:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@secure-non-root:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@sol-reset-invalid:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_params@sol-reset-not-gen7:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active@all-engines:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-active@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-gtt-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-wc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-wc-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-range:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-range-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-scanout:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-scanout@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-scanout@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-scanout@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-scanout@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-scanout@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-softpin:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-gtt-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-cpu:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-read:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@deep:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@deep@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@deep@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@deep@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@deep@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice-all:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fifo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fifo@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fifo@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fifo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fifo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@fifo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-boths:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-boths@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-boths@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-boths@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-boths@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-boths@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-read-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-read-write@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-read-write@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-read-write@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_schedule@implicit-read-write@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0420668506281988342==--
