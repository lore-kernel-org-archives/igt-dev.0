Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 22 Jun 2020 21:07:48 -0000
Message-ID: <159286006880.9207.8333032765779318723@emeril.freedesktop.org>
References: <20200622190820.849154-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200622190820.849154-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev8=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev8)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5716_full -> IGTPW_4689_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4689_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4689_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4689_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb2/igt@gem_exec_schedule@fair-next-ping@bcs0.html

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +15 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb3/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][3] +12 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb7/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-none-rrul@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +25 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl3/igt@gem_exec_schedule@fair-none-rrul@rcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5] +19 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-glk6/igt@gem_exec_schedule@fair-throttle-solo@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][6] +44 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb2/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vecs0} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][7] +10 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-apl4/igt@gem_exec_schedule@fair-throttle-solo@vecs0.html

  * {igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][8] +41 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb2/igt@gem_exec_schedule@fair-throttle@rcs0.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-iclb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb6/igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt.html

  
New tests
---------

  New tests have been introduced between IGT_5716_full and IGTPW_4689_full:

### New IGT tests (158) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 6.35] s

  * igt@gem_exec_schedule@fair-flow-ping@rcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.35] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.15, 6.37] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 1 skip(s)
    - Exec time: [2.16] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.15, 6.36] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.98] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.79, 13.45] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.90, 13.56] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.57] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.89, 13.60] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.99] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.84, 13.43] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.90, 13.59] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.59] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.90, 13.65] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.30] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.50, 15.06] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.98, 15.18] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.47, 13.25] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 1 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 15.11] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 6.34] s

  * igt@gem_exec_schedule@fair-next-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 6.33] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.33] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 1 skip(s)
    - Exec time: [2.16] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.15, 6.35] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.04] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.77, 13.40] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.91, 13.54] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.54] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.90, 13.57] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.98] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 1 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 13.39] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.92, 13.61] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.97, 13.55] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.92, 13.51] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 8.43] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 8.18] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.58, 8.51] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.49, 8.19] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.48, 8.42] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.87] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.28, 12.79] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.06, 14.72] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.17, 12.61] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.06, 15.46] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.33] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.46, 16.02] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.47, 13.29] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [10.06, 12.23] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.54, 13.26] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 19.31] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [13.04, 18.90] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [13.75, 19.48] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [13.75, 19.32] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [13.74, 19.29] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.69] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.55, 13.49] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.58, 16.16] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [13.74, 15.61] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.58, 15.81] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.30] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [9.64, 13.09] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.50, 13.34] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.99, 12.19] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.52, 13.35] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 6.36] s

  * igt@gem_exec_schedule@fair-pace-ping@rcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.11, 6.35] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.13, 6.35] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 1 skip(s)
    - Exec time: [2.13] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.14, 6.36] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.65] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.55, 10.68] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.63, 10.79] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [10.60, 10.81] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.60, 10.79] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.61] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.38, 10.59] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.38, 10.61] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.38, 8.50] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.52, 10.60] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.64] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.57, 11.44] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.61, 11.50] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [10.60, 10.79] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.54, 11.49] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.98] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 1 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 13.54] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.93, 13.72] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.70] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.91, 13.73] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 2.08] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.08, 13.43] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.08, 11.62] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [2.08, 8.62] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.08, 13.49] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.83] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.61, 13.23] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.56, 13.34] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.26] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.58, 13.30] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.25] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.15, 4.49] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.06, 4.46] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.18, 4.29] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.07, 4.36] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.98] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.71, 10.83] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 1 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 11.68] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [9.02] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [8.68, 11.19] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.02] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.61, 14.29] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [7.06, 10.03] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [7.31, 9.57] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [7.68, 12.69] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.76] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.16, 11.62] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 2 fail(s) 1 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 11.64] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [9.12] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [2.58, 11.40] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.09] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.47, 11.82] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 2 fail(s) 1 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 12.02] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [6.63, 11.12] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [6.63, 10.97] s

  * igt@gem_exec_schedule@fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.08] s

  * igt@gem_exec_schedule@fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4689_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close@basic:
    - shard-hsw:          [PASS][11] -> [TIMEOUT][12] ([i915#1958]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-hsw6/igt@gem_close@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-hsw4/igt@gem_close@basic.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_param@non-root-set:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#93] / [i915#95]) +42 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl4/igt@gem_ctx_param@non-root-set.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl4/igt@gem_ctx_param@non-root-set.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#926])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-iclb7/igt@gem_exec_balancer@bonded-early.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb2/igt@gem_exec_balancer@bonded-early.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#2079])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl3/igt@gem_exec_balancer@bonded-early.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl3/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_sync@basic-many-each:
    - shard-snb:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-snb6/igt@gem_sync@basic-many-each.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-snb5/igt@gem_sync@basic-many-each.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][23] -> [DMESG-FAIL][24] ([i915#118] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-glk2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1635] / [i915#95]) +38 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#54] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-apl1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-apl4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#1635] / [i915#54] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#83])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#83])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#1982]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-kbl3/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@syncobj_wait@wait-all-for-submit-complex:
    - shard-tglb:         [PASS][55] -> [DMESG-WARN][56] ([i915#402]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-tglb2/igt@syncobj_wait@wait-all-for-submit-complex.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb5/igt@syncobj_wait@wait-all-for-submit-complex.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@hostile:
    - shard-tglb:         [DMESG-WARN][57] ([i915#402]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-tglb2/igt@gem_ctx_persistence@hostile.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1958]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-tglb8/igt@gem_exec_endless@dispatch@vcs1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5716/shard-glk4/igt@gem_exec_whisper@basic-normal.html
   [62]: https://intel-gfx-ci

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4689/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
