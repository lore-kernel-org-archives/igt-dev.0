Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 03 Aug 2020 18:34:12 -0000
Message-ID: <159647965215.19295.1188255391221041349@emeril.freedesktop.org>
References: <20200803135753.58654-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200803135753.58654-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0597540333=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0597540333==
Content-Type: multipart/alternative;
 boundary="===============3177944152285672843=="

--===============3177944152285672843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev9)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8834_full -> IGTPW_4846_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4846_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4846_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4846_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb4/igt@gem_exec_schedule@fair-flow-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb1/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-pace@vecs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][3] +19 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-kbl2/igt@gem_exec_schedule@fair-pace@vecs0.html

  * {igt@gem_exec_schedule@fair-sync-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb3/igt@gem_exec_schedule@fair-sync-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5] +12 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-glk4/igt@gem_exec_schedule@fair-throttle-solo@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][6] +48 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb6/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][7] +47 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb4/igt@gem_exec_schedule@fair-throttle@rcs0.html

  * igt@prime_busy@before@vecs0:
    - shard-hsw:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@prime_busy@before@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw1/igt@prime_busy@before@vecs0.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> ([FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb2/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb5/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb3/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb7/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb3/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb1/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb5/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb7/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8834_full and IGTPW_4846_full:

### New IGT tests (158) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 6.37] s

  * igt@gem_exec_schedule@fair-flow-ping@rcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.38] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.14, 6.37] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.13, 6.36] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.14, 6.35] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.97] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.82, 13.44] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.89, 13.55] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.68] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.89, 13.70] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.98] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.79, 13.46] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 13.63] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.91, 13.64] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.66] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.32] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [11.38, 14.94] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [11.46, 15.03] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.46, 13.36] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [11.43, 15.03] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.98] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.79, 13.49] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.84, 13.62] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.90, 13.67] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.67] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.02] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.75, 13.46] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 13.60] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.94, 13.65] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.91, 13.62] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 11.38] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.35, 8.22] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [2.60, 11.22] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 1 incomplete(s) 1 skip(s)
    - Exec time: [0.0, 2.51] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.64, 8.31] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 2.08] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.13, 11.58] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.06, 14.47] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [9.48] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [2.06, 14.63] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.25] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [9.59, 13.36] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.43, 13.12] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [12.11, 12.82] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [10.31, 13.25] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 15.68] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [13.12, 15.67] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [13.54, 19.12] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [13.57, 19.07] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [15.80, 19.23] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.50] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.60, 13.69] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.58, 16.25] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [2.59, 13.50] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.59, 13.42] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.22] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.65, 13.31] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [10.54, 13.20] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [12.10, 13.07] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [10.58, 13.28] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 6.34] s

  * igt@gem_exec_schedule@fair-pace-ping@rcs0:
    - Statuses : 1 incomplete(s) 4 skip(s)
    - Exec time: [0.0, 6.36] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.12, 6.35] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 1 skip(s)
    - Exec time: [2.16] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [2.12, 6.34] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.69] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.54, 10.73] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.60, 10.79] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [10.56, 10.85] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.66, 11.69] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.62] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.52, 10.61] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.51, 10.60] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.54, 10.53] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.48, 10.64] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.67] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.53, 10.65] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.60, 10.80] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [10.57, 10.77] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.52, 11.61] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.99] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 13.56] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.90, 13.73] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.75] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.93, 13.71] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.85] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.11, 15.16] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.07, 15.56] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 10.81] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [10.87, 15.49] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.86] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.17, 13.43] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.08, 13.52] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [2.08, 13.48] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.08, 13.54] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.87] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.61, 13.30] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.56, 13.38] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.37] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.56, 13.39] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.60] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.12, 11.94] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [2.07, 12.21] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.87, 11.12] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 12.12] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 14.78] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.95, 12.19] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.92, 11.98] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.39, 11.59] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.90, 12.37] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 16.30] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.37, 14.49] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.51, 15.92] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [11.53, 16.37] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.45, 16.29] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 2.59] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.18, 11.71] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.10, 12.94] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [2.59, 11.92] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.58, 12.74] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 14.90] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.04, 12.11] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.98, 14.50] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [11.34, 14.27] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.01, 14.33] s

  * igt@gem_exec_schedule@fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@gem_exec_schedule@fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.02, 2.03] s

  * igt@gem_exec_schedule@fairslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

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

  Here are the changes found in IGTPW_4846_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-hsw:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#2122]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +12 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-glk:          [PASS][29] -> [DMESG-FAIL][30] ([i915#118] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#433])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_lease@invalid-create-leases:
    - shard-snb:          [PASS][37] -> [TIMEOUT][38] ([i915#1958]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb5/igt@kms_lease@invalid-create-leases.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-snb6/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_cursor@pipe-b-primary-size-64:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1635] / [i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl4/igt@kms_plane_cursor@pipe-b-primary-size-64.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-apl4/igt@kms_plane_cursor@pipe-b-primary-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109642] / [fdo#111068]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][45] -> [FAIL][46] ([i915#1542])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-iclb4/igt@perf@blocking-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][47] -> [DMESG-WARN][48] ([i915#1982]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-tglb3/igt@perf_pmu@module-unload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb5/igt@perf_pmu@module-unload.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#2258]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw2/igt@prime_busy@hang-wait@bcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-glk:          [DMESG-WARN][51] ([i915#2165]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-glk2/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-apl:          [FAIL][53] ([i915#1635]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][55] ([i915#1436] / [i915#716]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_addfb_basic@small-bo:
    - shard-snb:          [TIMEOUT][57] ([i915#1958]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-snb2/igt@kms_addfb_basic@small-bo.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-snb2/igt@kms_addfb_basic@small-bo.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-kbl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-kbl2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-hsw:          [TIMEOUT][61] ([i915#1958]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8834/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-pl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/index.html

--===============3177944152285672843==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/gem_exec_schedule: Try to spot unfairne=
ss (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/77887/">https://patchwork.freedesktop.org/series/77887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4846/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4846/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8834_full -&gt; IGTPW_4846_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4846_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_4846_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4846=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-iclb4/igt@gem_exec_schedule@fair-flow-ping@r=
cs0.html">SKIP</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-tglb1/igt@gem_exec_schedule@fair-none-ping@r=
cs0.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace@vecs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-kbl2/igt@gem_exec_schedule@fair-pace@vecs0.h=
tml">FAIL</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-sync-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-tglb3/igt@gem_exec_schedule@fair-sync-solo@v=
cs1.html">INCOMPLETE</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-glk4/igt@gem_exec_schedule@fair-throttle-sol=
o@vcs0.html">FAIL</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-tglb6/igt@gem_exec_schedule@fair-throttle-so=
lo@vcs1.html">FAIL</a> +48 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-iclb4/igt@gem_exec_schedule@fair-throttle@rc=
s0.html">FAIL</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_busy@before@vecs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-hsw1/igt@prime_busy@before@vecs0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw1/igt=
@prime_busy@before@vecs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_4846/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4846/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb3/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4846/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb3/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4846/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb5/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4846/shard-tglb7/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8834_full and IGTPW_4846_f=
ull:</p>
<h3>New IGT tests (158)</h3>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 6.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s) 4 skip(s)</li>
<li>Exec time: [0.0, 6.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [2.14, 6.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.13, 6.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vecs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [2.14, 6.35] s</li>
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
<li>Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.82, 13.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.89, 13.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.89, 13.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.79, 13.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.89, 13.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.91, 13.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.91, 13.66] s</li>
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
<p>igt@gem_exec_schedule@fair-half@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [11.38, 14.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [11.46, 15.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.46, 13.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [11.43, 15.03] s</li>
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
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Exec time: [0.0, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.79, 13.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.84, 13.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.90, 13.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.91, 13.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.75, 13.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 13.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.94, 13.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.91, 13.62] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 11.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.35, 8.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [2.60, 11.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vecs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [2.64, 8.31] s</li>
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
<li>Statuses : 1 fail(s) 1 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [2.13, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [2.06, 14.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [9.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [2.06, 14.63] s</li>
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
<li>Exec time: [0.0, 13.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [9.59, 13.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.43, 13.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [12.11, 12.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [10.31, 13.25] s</li>
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
<li>Exec time: [0.0, 15.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [13.12, 15.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [13.54, 19.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [13.57, 19.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [15.80, 19.23] s</li>
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
<li>Exec time: [0.0, 12.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [2.60, 13.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [2.58, 16.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [2.59, 13.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [2.59, 13.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.65, 13.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [10.54, 13.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [12.10, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [10.58, 13.28] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@bcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@rcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s) 4 skip(s)</li>
<li>Exec time: [0.0, 6.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [2.12, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vecs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [2.12, 6.34] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.54, 10.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.60, 10.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [10.56, 10.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.66, 11.69] s</li>
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
<li>Exec time: [0.0, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [8.52, 10.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [8.51, 10.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.54, 10.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [8.48, 10.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.53, 10.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.60, 10.80] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [10.57, 10.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.52, 11.61] s</li>
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
<p>igt@gem_exec_schedule@fair-spare@bcs0:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.89, 13.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.90, 13.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.93, 13.71] s</li>
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
<li>Exec time: [0.0, 12.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.11, 15.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.07, 15.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs1:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 10.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [10.87, 15.49] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [2.17, 13.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [2.08, 13.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [2.08, 13.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [2.08, 13.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.61, 13.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.56, 13.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [8.56, 13.39] s</li>
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
<li>Exec time: [0.0, 13.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [2.12, 11.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [2.07, 12.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.87, 11.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 12.12] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 14.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.95, 12.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.92, 11.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [11.39, 11.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.90, 12.37] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 16.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.37, 14.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.51, 15.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [11.53, 16.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.45, 16.29] s</li>
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
<li>Statuses : 1 fail(s) 1 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [2.18, 11.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [2.10, 12.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [2.59, 11.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [2.58, 12.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 14.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.04, 12.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.98, 14.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [11.34, 14.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.01, 14.33] s</li>
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
<li>Exec time: [2.02, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
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
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4846_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-hsw1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cur=
sor-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_4846/shard-hsw8/igt@kms_cursor_legacy@2x-nonblocking-modeset=
-vs-cursor-atomic.html">TIMEOUT</a> ([i915#1958]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a=
1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-hsw1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interru=
ptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_4846/shard-hsw1/igt@kms_flip@2x-blocking-absolut=
e-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982]=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
846/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a>=
 ([i915#2122]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4846/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DM=
ESG-WARN</a> ([i915#180]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-in=
dfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4846/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-indfb-draw-render.html">DMESG-FAIL</a> ([i915#118] / [i915#95])</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846=
/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a>=
 ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mma=
p-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4846/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-m=
map-gtt.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tg=
lb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-snb5/igt@kms_lease@invalid-create-leases.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-=
snb6/igt@kms_lease@invalid-create-leases.html">TIMEOUT</a> ([i915#1958]) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-64:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-apl4/igt@kms_plane_cursor@pipe-b-primary-size-64.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_484=
6/shard-apl4/igt@kms_plane_cursor@pipe-b-primary-size-64.html">DMESG-WARN</=
a> ([i915#1635] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb5/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068]) +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-iclb=
1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +3 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-icl=
b1/igt@perf@blocking-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-tglb3/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-tglb5/ig=
t@perf_pmu@module-unload.html">DMESG-WARN</a> ([i915#1982]) +4 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-hsw2/igt@prime_busy@hang-wait@bcs0.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4846/shard-hsw4/i=
gt@prime_busy@hang-wait@bcs0.html">FAIL</a> ([i915#2258]) +3 similar issues=
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html">DMESG-WARN<=
/a> ([i915#2165]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4846/shard-glk2/igt@gem_mmap_gtt@fault-concurrent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-unc=
ached.html">FAIL</a> ([i915#1635]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4846/shard-apl6/igt@gem_partial_pwrite_pread@writes=
-after-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-kbl4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a=
> ([i915#1436] / [i915#716]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_4846/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-snb2/igt@kms_addfb_basic@small-bo.html">TIMEOUT</a> ([i9=
15#1958]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
846/shard-snb2/igt@kms_addfb_basic@small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-=
WARN</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4846/shard-kbl2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html"=
>TIMEOUT</a> ([i915#1958]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4846/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-rand=
om.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8834/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMES=
G-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4846/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html"=
>PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-pl</p>
</li>
</ul>

</body>
</html>

--===============3177944152285672843==--

--===============0597540333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0597540333==--
