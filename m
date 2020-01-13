Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jan 2020 18:44:16 -0000
Message-ID: <157894105678.25472.10737610294771081962@emeril.freedesktop.org>
References: <20200110113144.10893-1-petri.latvala@intel.com>
In-Reply-To: <20200110113144.10893-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcGVyZl9w?=
 =?utf-8?q?mu=3A_Use_dynamic_subtests?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: perf_pmu: Use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/71879/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5361_full -> IGTPW_3913_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3913_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3913_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3913_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_hangcheck:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb1/igt@i915_selftest@live_hangcheck.html

  * {igt@perf_pmu@event-wait@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb7/igt@perf_pmu@event-wait@rcs0.html

  
New tests
---------

  New tests have been introduced between IGT_5361_full and IGTPW_3913_full:

### New IGT tests (158) ###

  * igt@perf_pmu@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-2:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-2@bcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@perf_pmu@busy-accuracy-2@rcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@perf_pmu@busy-accuracy-2@vcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@perf_pmu@busy-accuracy-2@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [3.04, 3.05] s

  * igt@perf_pmu@busy-accuracy-2@vecs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@perf_pmu@busy-accuracy-50:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@perf_pmu@busy-accuracy-50@rcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@perf_pmu@busy-accuracy-50@vcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@perf_pmu@busy-accuracy-50@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.52] s

  * igt@perf_pmu@busy-accuracy-50@vecs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@perf_pmu@busy-accuracy-98:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-98@bcs0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.05] s

  * igt@perf_pmu@busy-accuracy-98@rcs0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.05] s

  * igt@perf_pmu@busy-accuracy-98@vcs0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.04] s

  * igt@perf_pmu@busy-accuracy-98@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [3.03] s

  * igt@perf_pmu@busy-accuracy-98@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.04] s

  * igt@perf_pmu@busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-check-all@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@busy-check-all@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@busy-check-all@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 1.01] s

  * igt@perf_pmu@busy-check-all@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51] s

  * igt@perf_pmu@busy-check-all@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.51] s

  * igt@perf_pmu@busy-double-start:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-double-start@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [3.51, 3.53] s

  * igt@perf_pmu@busy-double-start@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [3.51, 3.53] s

  * igt@perf_pmu@busy-double-start@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [3.52, 4.01] s

  * igt@perf_pmu@busy-double-start@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@perf_pmu@busy-double-start@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [3.52] s

  * igt@perf_pmu@busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-hang@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.01, 1.03] s

  * igt@perf_pmu@busy-hang@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@perf_pmu@busy-hang@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.01, 1.51] s

  * igt@perf_pmu@busy-hang@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.02] s

  * igt@perf_pmu@busy-hang@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@perf_pmu@busy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-idle-check-all@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle-check-all@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 1.11] s

  * igt@perf_pmu@busy-idle-check-all@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle-no-semaphores:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-idle-no-semaphores@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 0.61] s

  * igt@perf_pmu@busy-idle-no-semaphores@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 0.61] s

  * igt@perf_pmu@busy-idle-no-semaphores@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 0.61] s

  * igt@perf_pmu@busy-idle-no-semaphores@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@perf_pmu@busy-idle-no-semaphores@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 0.61] s

  * igt@perf_pmu@busy-idle@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 1.11] s

  * igt@perf_pmu@busy-idle@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-idle@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@busy-no-semaphores:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-no-semaphores@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@perf_pmu@busy-no-semaphores@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@busy-no-semaphores@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@perf_pmu@busy-no-semaphores@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@perf_pmu@busy-no-semaphores@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@perf_pmu@busy-start:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-start@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.51, 2.52] s

  * igt@perf_pmu@busy-start@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.51, 2.52] s

  * igt@perf_pmu@busy-start@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.51, 3.01] s

  * igt@perf_pmu@busy-start@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.51] s

  * igt@perf_pmu@busy-start@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.51, 2.52] s

  * igt@perf_pmu@busy@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@busy@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@busy@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 1.01] s

  * igt@perf_pmu@busy@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@perf_pmu@busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@enable-race:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@enable-race@bcs0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 12.64] s

  * igt@perf_pmu@enable-race@rcs0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 12.61] s

  * igt@perf_pmu@enable-race@vcs0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 12.60] s

  * igt@perf_pmu@enable-race@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.55, 12.56] s

  * igt@perf_pmu@enable-race@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 12.60] s

  * igt@perf_pmu@event-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@event-wait@rcs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@perf_pmu@idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@idle-no-semaphores:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@idle-no-semaphores@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle-no-semaphores@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle-no-semaphores@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle-no-semaphores@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle-no-semaphores@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@idle@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.50] s

  * igt@perf_pmu@init-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@init-busy@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-busy@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  * igt@perf_pmu@init-busy@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@perf_pmu@init-busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@perf_pmu@init-sema:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@init-sema@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-sema@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-sema@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-sema@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@perf_pmu@init-sema@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@init-wait@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-wait@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-wait@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-wait@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@init-wait@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@most-busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@most-busy-check-all@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@most-busy-check-all@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@most-busy-check-all@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@most-busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@most-busy-idle-check-all@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@most-busy-idle-check-all@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@most-busy-idle-check-all@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@most-busy-idle-check-all@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@multi-client:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@multi-client@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@perf_pmu@multi-client@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.00, 1.01] s

  * igt@perf_pmu@multi-client@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.51] s

  * igt@perf_pmu@multi-client@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@perf_pmu@multi-client@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [1.01] s

  * igt@perf_pmu@render-node-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@render-node-busy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@render-node-busy-idle@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@render-node-busy-idle@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 0.62] s

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 1.11] s

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@perf_pmu@render-node-busy-idle@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.62] s

  * igt@perf_pmu@render-node-busy@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@render-node-busy@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51] s

  * igt@perf_pmu@render-node-busy@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 1.01] s

  * igt@perf_pmu@render-node-busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@render-node-busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@perf_pmu@semaphore-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@semaphore-busy@bcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.18] s

  * igt@perf_pmu@semaphore-busy@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.17] s

  * igt@perf_pmu@semaphore-busy@vcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.17] s

  * igt@perf_pmu@semaphore-busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.20] s

  * igt@perf_pmu@semaphore-busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [4.62, 6.18] s

  * igt@perf_pmu@semaphore-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@semaphore-wait-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@semaphore-wait-idle@bcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait-idle@rcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait-idle@vcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait-idle@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.51] s

  * igt@perf_pmu@semaphore-wait-idle@vecs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait@bcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait@rcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait@vcs0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@perf_pmu@semaphore-wait@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51] s

  * igt@perf_pmu@semaphore-wait@vecs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  

Known issues
------------

  Here are the changes found in IGTPW_3913_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112080]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#679])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-glk2/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-glk7/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([fdo#111735]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb1/igt@gem_ctx_shared@q-smoketest-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb1/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-apl6/igt@gem_eio@in-flight-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb3/igt@gem_exec_async@concurrent-writes-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([i915#472])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb4/igt@gem_exec_create@madvise.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb5/igt@gem_exec_create@madvise.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109276]) +23 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd2:
    - shard-tglb:         [PASS][20] -> [INCOMPLETE][21] ([fdo#111606] / [fdo#111677] / [i915#472])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb5/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-vebox:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([fdo#111677] / [i915#472]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][24] -> [TIMEOUT][25] ([fdo#112271] / [i915#530])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#644])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [PASS][28] -> [INCOMPLETE][29] ([i915#470] / [i915#472]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb1/igt@gem_sync@basic-all.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb6/igt@gem_sync@basic-all.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][30] -> [FAIL][31] ([i915#818])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [PASS][32] -> [DMESG-WARN][33] ([fdo#111870]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [PASS][36] -> [DMESG-WARN][37] ([i915#958])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb6/igt@i915_pm_rpm@gem-idle.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb3/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [PASS][38] -> [DMESG-WARN][39] ([i915#118] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-glk7/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#54])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][44] -> [FAIL][45] ([i915#49]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-hsw:          [PASS][48] -> [DMESG-WARN][49] ([i915#44])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-hsw7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-hsw5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [fdo#112080]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb7/igt@gem_ctx_isolation@vcs1-reset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb1/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-apl:          [FAIL][52] ([i915#679]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-apl6/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-apl8/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][54] ([fdo#111735]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb4/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb2/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [INCOMPLETE][56] ([i915#470]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb1/igt@gem_eio@reset-stress.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb5/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [FAIL][58] ([i915#232]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-snb1/igt@gem_eio@unwedge-stress.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-snb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@smoke:
    - shard-tglb:         [INCOMPLETE][60] ([fdo#111593] / [i915#472]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb1/igt@gem_exec_balancer@smoke.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][62] ([fdo#109276]) -> [PASS][63] +16 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][64] ([i915#677]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-vebox:
    - shard-tglb:         [INCOMPLETE][66] ([i915#472]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb3/igt@gem_exec_schedule@preempt-other-vebox.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb3/igt@gem_exec_schedule@preempt-other-vebox.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox:
    - shard-tglb:         [INCOMPLETE][68] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][70] ([fdo#112146]) -> [PASS][71] +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][72] ([fdo#111870]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-iclb7/igt@gem_wait@await-vcs1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-iclb1/igt@gem_wait@await-vcs1.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [INCOMPLETE][76] ([i915#455]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-tglb3/igt@i915_selftest@live_gt_timelines.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/shard-tglb1/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5361/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [79]: https://int

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3913/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
