Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 10 Dec 2020 11:06:53 -0000
Message-ID: <160759841351.19115.317300442755111744@emeril.freedesktop.org>
References: <20201210020907.2392245-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201210020907.2392245-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev13=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2064876156=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2064876156==
Content-Type: multipart/alternative;
 boundary="===============8354593785516313282=="

--===============8354593785516313282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev13)
URL   : https://patchwork.freedesktop.org/series/77887/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9468_full -> IGTPW_5266_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5266_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb5/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-pace-ping@vcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +14 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb8/igt@gem_exec_schedule@fair-pace-ping@vcs0.html

  * {igt@gem_exec_schedule@fair-pace-share@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk7/igt@gem_exec_schedule@fair-pace-share@vcs0.html

  * {igt@gem_exec_schedule@fair-pace-solo@vcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +11 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-kbl7/igt@gem_exec_schedule@fair-pace-solo@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +46 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb7/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +33 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb2/igt@gem_exec_schedule@fair-throttle@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9468_full and IGTPW_5266_full:

### New IGT tests (189) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.22] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.15, 4.22] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.17, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.15, 4.22] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.07] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.09] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.63, 13.07] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.16, 13.07] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.08] s

  * igt@gem_exec_schedule@fair-flow-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.85] s

  * igt@gem_exec_schedule@fair-flow-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.63, 15.87] s

  * igt@gem_exec_schedule@fair-flow-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 11.73] s

  * igt@gem_exec_schedule@fair-flow-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.65, 11.30] s

  * igt@gem_exec_schedule@fair-flow-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 11.76] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.15] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.11] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.63, 13.11] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.11, 13.11] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.10] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.61] s

  * igt@gem_exec_schedule@fair-half-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.49, 15.62] s

  * igt@gem_exec_schedule@fair-half-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.48, 15.58] s

  * igt@gem_exec_schedule@fair-half-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.47, 13.40] s

  * igt@gem_exec_schedule@fair-half-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.59, 15.64] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.48] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.48, 16.36] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.99, 13.56] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.47, 13.48] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.46] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.40] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.17, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.16, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.18, 4.22] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.08] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.60, 13.06] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.59, 13.07] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.88, 13.06] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.02, 13.06] s

  * igt@gem_exec_schedule@fair-next-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.86] s

  * igt@gem_exec_schedule@fair-next-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.90, 11.54] s

  * igt@gem_exec_schedule@fair-next-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 11.72] s

  * igt@gem_exec_schedule@fair-next-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.64, 11.31] s

  * igt@gem_exec_schedule@fair-next-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 13.93] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.45] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.59, 13.10] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.02, 13.52] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.14, 13.49] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.59, 13.11] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.98] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.38, 11.73] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.87, 10.09] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [9.06, 9.55] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.04, 12.00] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.03] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.08, 12.10] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.49, 11.97] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.66, 9.89] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.51, 10.28] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 14.25] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [10.70, 14.49] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [11.80, 17.01] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [13.34, 18.89] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [11.94, 17.43] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.01] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [10.34, 12.65] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.71, 13.77] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [9.73, 13.60] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.93, 13.69] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 9.77] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.43, 12.22] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.54, 11.96] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [9.79, 11.95] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.51, 10.78] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.18] s

  * igt@gem_exec_schedule@fair-pace-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.09, 4.19] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.18] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.13, 4.18] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.18] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.62] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.51, 11.61] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.42, 11.42] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [8.36, 8.61] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.42, 11.53] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.55] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.45, 10.60] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.56, 10.62] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [8.38, 8.53] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.42, 10.83] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.62] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.50, 10.62] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.44, 10.63] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [10.61, 10.96] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.43, 10.96] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.86] s

  * igt@gem_exec_schedule@fair-spare-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.93, 13.73] s

  * igt@gem_exec_schedule@fair-spare-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.84] s

  * igt@gem_exec_schedule@fair-spare-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.73, 11.19] s

  * igt@gem_exec_schedule@fair-spare-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 13.87] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.17] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.04, 13.35] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.61, 13.10] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.18, 13.10] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.61, 13.13] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.56] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.71, 12.43] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.63, 12.20] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.50, 10.96] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.67, 12.10] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.05] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.03] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.68, 13.02] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [8.69, 13.03] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.71, 13.03] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.93] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 12.96] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.73, 12.93] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.60, 12.91] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.55, 12.93] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.07] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.74, 11.14] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.44, 9.15] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.84, 11.12] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.61, 9.15] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.44] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.78, 11.27] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.00, 11.50] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [9.12, 11.29] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.91, 11.76] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 12.86] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.11, 12.83] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [12.06, 13.05] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [12.00, 12.44] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [12.02, 12.98] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.68] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.97, 12.78] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.22, 11.83] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.15, 11.53] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.06, 12.01] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.47] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.78, 11.31] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.98, 11.58] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [8.92, 11.63] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.96, 11.89] s

  * igt@gem_exec_schedule@fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@gem_exec_schedule@fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@fairslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [2.01] s

  * igt@gem_exec_schedule@fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@u-fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.15] s

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - Statuses : 1 dmesg-warn(s) 4 pass(s)
    - Exec time: [2.01, 2.04] s

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.01] s

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_5266_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@file:
    - shard-hsw:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-hsw2/igt@gem_ctx_persistence@file.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#118] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk9/igt@gem_exec_create@forked.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk9/igt@gem_exec_create@forked.html

  * {igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [SKIP][10] ([fdo#109271]) +44 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-kbl1/igt@gem_exec_schedule@fair-flow-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-flow-solo@bcs0} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271]) +47 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-apl7/igt@gem_exec_schedule@fair-flow-solo@bcs0.html

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][12] ([fdo#109271]) +39 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk6/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-vip} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271]) +33 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-snb7/igt@gem_exec_schedule@fair-none-vip.html

  * {igt@gem_exec_schedule@fair-pace-ping@vcs1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#109276])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb1/igt@gem_exec_schedule@fair-pace-ping@vcs1.html

  * {igt@gem_exec_schedule@fair-pace-solo} (NEW):
    - shard-hsw:          NOTRUN -> [SKIP][15] ([fdo#109271]) +38 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-hsw4/igt@gem_exec_schedule@fair-pace-solo.html

  * {igt@gem_exec_schedule@u-fairslice@vcs0} (NEW):
    - shard-apl:          NOTRUN -> [DMESG-WARN][16] ([i915#1610])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-apl4/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#2768])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-iclb1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2597])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-tglb5/igt@kms_async_flips@test-time-stamp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109274] / [fdo#109278])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#49])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111825]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109280]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-tglb:         [PASS][30] -> [INCOMPLETE][31] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#2635] / [i915#533])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#2635] / [i915#533])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [PASS][36] -> [INCOMPLETE][37] ([i915#155] / [i915#648])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-iclb:         [PASS][38] -> [INCOMPLETE][39] ([i915#1185] / [i915#250])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-hsw:          [PASS][40] -> [DMESG-WARN][41] ([i915#2637])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [41]: https://intel-gfx-ci.01.org/tree/drm

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/index.html

--===============8354593785516313282==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_schedule: Try to spot unfairness (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/77887/">https://patchwork.freedesktop.org/series/77887/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9468_full -&gt; IGTPW_5266_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5266_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb5/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-ping@vcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb8/igt@gem_exec_schedule@fair-pace-ping@vcs0.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-share@vcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk7/igt@gem_exec_schedule@fair-pace-share@vcs0.html">FAIL</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo@vcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-kbl7/igt@gem_exec_schedule@fair-pace-solo@vcs0.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb7/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb2/igt@gem_exec_schedule@fair-throttle@vcs0.html">FAIL</a> +33 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9468_full and IGTPW_5266_full:</p>
<h3>New IGT tests (189)</h3>
<ul>
<li>
<p>igt@gem_exec_schedule@fair-flow:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@bcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.13, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.15, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.17, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.15, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.63, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.16, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.63, 15.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.94, 11.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.65, 11.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 11.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.63, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.11, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.49, 15.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.48, 15.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.47, 13.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.59, 15.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.48, 16.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.99, 13.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.47, 13.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.91, 13.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@bcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.17, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.16, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.18, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.60, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.59, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.88, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.02, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.90, 11.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 11.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.64, 11.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.94, 13.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.59, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.02, 13.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.14, 13.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.59, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.38, 11.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.87, 10.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [9.06, 9.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.04, 12.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.08, 12.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.49, 11.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.66, 9.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.51, 10.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 14.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [10.70, 14.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [11.80, 17.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [13.34, 18.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [11.94, 17.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [10.34, 12.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.71, 13.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [9.73, 13.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.93, 13.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 9.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.43, 12.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.54, 11.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.79, 11.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.51, 10.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@bcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.09, 4.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.12, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.13, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.12, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.51, 11.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.42, 11.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [8.36, 8.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.42, 11.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.45, 10.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.56, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [8.38, 8.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.42, 10.83] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.50, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.44, 10.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [10.61, 10.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.43, 10.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.93, 13.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.91, 13.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.73, 11.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 13.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.04, 13.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.61, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.18, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.61, 13.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.71, 12.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.63, 12.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.50, 10.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.67, 12.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.91, 13.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.68, 13.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [8.69, 13.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.71, 13.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.89, 12.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.73, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.60, 12.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.55, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.74, 11.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.44, 9.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.84, 11.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.61, 9.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.78, 11.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.00, 11.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [9.12, 11.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.91, 11.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.11, 12.83] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [12.06, 13.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [12.00, 12.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [12.02, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.97, 12.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.22, 11.83] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.15, 11.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.06, 12.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.78, 11.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.98, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [8.92, 11.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.96, 11.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice-all:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice-all:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 4 pass(s)</li>
<li>Exec time: [2.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5266_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@file:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-hsw2/igt@gem_ctx_persistence@file.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk9/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk9/igt@gem_exec_create@forked.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-kbl1/igt@gem_exec_schedule@fair-flow-ping@rcs0.html">SKIP</a> ([fdo#109271]) +44 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-flow-solo@bcs0} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-apl7/igt@gem_exec_schedule@fair-flow-solo@bcs0.html">SKIP</a> ([fdo#109271]) +47 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk6/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> ([fdo#109271]) +39 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-vip} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-snb7/igt@gem_exec_schedule@fair-none-vip.html">SKIP</a> ([fdo#109271]) +33 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-ping@vcs1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb1/igt@gem_exec_schedule@fair-pace-ping@vcs1.html">SKIP</a> ([fdo#109276])</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-hsw4/igt@gem_exec_schedule@fair-pace-solo.html">SKIP</a> ([fdo#109271]) +38 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs0} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-apl4/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#1610])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-iclb1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> ([i915#2768])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109280]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#2635] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#2635] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> ([i915#155] / [i915#648])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5266/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> ([i915#1185] / [i915#250])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9468/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm">DMESG-WARN</a> ([i915#2637])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8354593785516313282==--

--===============2064876156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2064876156==--
