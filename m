Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jul 2020 12:06:38 -0000
Message-ID: <159438279826.20497.11092587944486577361@emeril.freedesktop.org>
References: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/6=5D_lib/i915=3A_Report_unknown_dev?=
 =?utf-8?q?ice_as_the_future?=
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

Series: series starting with [i-g-t,1/6] lib/i915: Report unknown device as the future
URL   : https://patchwork.freedesktop.org/series/79336/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8725_full -> IGTPW_4753_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4753_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4753_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4753_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-iclb1/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2] +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-tglb5/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl6/igt@gem_exec_schedule@fair-none-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][4] +32 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-tglb3/igt@gem_exec_schedule@fair-none-solo@rcs0.html

  * {igt@gem_exec_schedule@fair-pace-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-tglb1/igt@gem_exec_schedule@fair-pace-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-pace-solo@vecs0} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][6] +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-apl1/igt@gem_exec_schedule@fair-pace-solo@vecs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][7] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-glk4/igt@gem_exec_schedule@fair-throttle-solo@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][8] +34 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-iclb3/igt@gem_exec_schedule@fair-throttle@rcs0.html

  * igt@perf@enable-disable:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-hsw5/igt@perf@enable-disable.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-hsw8/igt@perf@enable-disable.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8725_full and IGTPW_4753_full:

### New IGT tests (157) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping@bcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.38] s

  * igt@gem_exec_schedule@fair-flow-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 6.36] s

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
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.99] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.80, 13.42] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.90, 13.60] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.91, 13.67] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 13.61] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.96] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.83, 13.44] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.90, 13.59] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.91, 13.59] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.63] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.31] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.47, 14.97] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.51, 14.95] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.50, 13.32] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.49, 14.93] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 6.37] s

  * igt@gem_exec_schedule@fair-next-ping@rcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.37] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.15, 6.35] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.14, 6.36] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.15, 6.36] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.02] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.78, 13.45] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.82, 13.60] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.93, 13.62] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.59] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.96] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.81, 13.34] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.49] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.93, 13.52] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.51] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 8.50] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 8.24] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.62, 8.30] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 1 skip(s)
    - Exec time: [2.62] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.59, 8.43] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.96] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.19, 11.64] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.06, 15.15] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.15, 12.43] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 15.48] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.27] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.56, 13.04] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.53, 13.32] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [10.04, 13.34] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.55, 13.34] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 19.32] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [13.13, 19.05] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [14.99, 19.18] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [16.72, 19.39] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [15.77, 19.40] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.64] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.55, 13.78] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.58, 13.71] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [12.57, 13.88] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.58, 16.32] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [13.21] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [10.90] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping@bcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.35] s

  * igt@gem_exec_schedule@fair-pace-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.11, 6.37] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.11, 6.35] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.15, 6.37] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.11, 6.37] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.57] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.51, 10.66] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.49, 10.59] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.49, 10.50] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.50, 10.60] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.63] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.68, 12.09] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.72, 11.49] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.53, 10.56] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.65, 11.52] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.02] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 13.54] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.87, 13.68] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.93, 13.68] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 13.66] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.81] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.10, 15.35] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.03, 15.98] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.67, 12.72] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.01, 15.77] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.82] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.19, 13.48] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.08, 13.46] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.81, 13.42] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.08, 13.46] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.85] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.59, 13.25] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.54, 13.28] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.47, 12.77] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.54, 13.27] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 2.06] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.09, 11.88] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.07, 12.19] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [2.07, 11.29] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.07, 12.13] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.76] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.78, 11.86] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.92, 12.36] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [11.46, 14.31] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.80, 14.77] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 1 fail(s)
    - Exec time: [12.70] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 1 fail(s)
    - Exec time: [13.39] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 1 fail(s)
    - Exec time: [13.96] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 14.34] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.19, 12.20] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.10, 13.09] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [12.03, 12.59] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.10, 13.18] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 14.80] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.06, 12.00] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.92, 14.48] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.54, 11.64] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.01, 14.77] s

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
    - Exec time: [2.01, 2.05] s

  * igt@gem_exec_schedule@fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_softpin@active:
    - Statuses : 2 pass(s) 5 timeout(s)
    - Exec time: [5.73, 120.48] s

  

Known issues
------------

  Here are the changes found in IGTPW_4753_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_copy@x-tiled:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-tglb5/igt@gem_render_copy@x-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-tglb6/igt@gem_render_copy@x-tiled.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1436] / [i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@execlists:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#794])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl6/igt@i915_selftest@live@execlists.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl2/igt@i915_selftest@live@execlists.html

  * igt@kms_atomic_interruptible@legacy-pageflip:
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-snb2/igt@kms_atomic_interruptible@legacy-pageflip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-snb6/igt@kms_atomic_interruptible@legacy-pageflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][19] -> [DMESG-FAIL][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1635] / [i915#95]) +37 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-apl2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-apl1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#64])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1525])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-apl1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#1635] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([CI#80] / [i915#155])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][43] -> [DMESG-FAIL][44] ([fdo#108145] / [i915#1635] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][45] -> [DMESG-WARN][46] ([i915#1982])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#173])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-iclb4/igt@kms_psr@no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-kbl:          [PASS][51] -> [DMESG-WARN][52] ([i915#93] / [i915#95]) +37 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl2/igt@kms_rmfb@rmfb-ioctl.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl7/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-kbl1/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-kbl3/igt@kms_setmode@basic.html

  * igt@perf_pmu@frequency-idle:
    - shard-snb:          [PASS][55] -> [TIMEOUT][56] ([i915#1958] / [i915#2119])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-snb2/igt@perf_pmu@frequency-idle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-snb2/igt@perf_pmu@frequency-idle.html
    - shard-hsw:          [PASS][57] -> [TIMEOUT][58] ([i915#1958] / [i915#2119])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-hsw8/igt@perf_pmu@frequency-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-hsw8/igt@perf_pmu@frequency-idle.html

  
#### Possible fixes ####

  * igt@gem_eio@reset-stress:
    - shard-glk:          [INCOMPLETE][59] ([i915#58] / [k.org#198133]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-glk4/igt@gem_eio@reset-stress.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-glk5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-glk5/igt@gem_exec_gttfill@all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-glk9/igt@gem_exec_gttfill@all.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][63] ([i915#1958] / [i915#2119]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-hsw4/igt@gem_userptr_blits@create-destroy-sync.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][65] ([i915#402]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/shard-tglb1/igt@i915_module_load@reload.html
   [66]: https://intel-gfx-ci.01.org/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
