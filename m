Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Nov 2020 05:29:40 -0000
Message-ID: <160628218092.8879.7138044721661689424@emeril.freedesktop.org>
References: <20201124233913.502412-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201124233913.502412-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev10=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1836344328=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1836344328==
Content-Type: multipart/alternative;
 boundary="===============2572861190044584322=="

--===============2572861190044584322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev10)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9385_full -> IGTPW_5222_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5222_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5222_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5222_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb1/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb8/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][3] +14 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-kbl2/igt@gem_exec_schedule@fair-none-solo@rcs0.html

  * {igt@gem_exec_schedule@fair-pace-solo@vecs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][4] +9 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk6/igt@gem_exec_schedule@fair-pace-solo@vecs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +29 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb7/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +22 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb6/igt@gem_exec_schedule@fair-throttle@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
    - shard-hsw:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw7/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw8/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][10] ([i915#1804]) -> [WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9385_full and IGTPW_5222_full:

### New IGT tests (170) ###

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
    - Exec time: [2.13, 4.42] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.16, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.27] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.87, 13.27] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.30] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.11, 13.27] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.29] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.52] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.99, 13.58] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.98, 13.98] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [13.12, 14.01] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.05, 13.96] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.72] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.50, 16.09] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.51, 16.02] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.55, 13.72] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.03, 16.02] s

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
    - Exec time: [2.14, 4.39] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.16, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.14, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.22] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.23] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 13.22] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.26] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.13, 13.06] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.25] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.47] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.70] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.96, 13.92] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [13.09, 13.94] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.97, 13.89] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 7.50] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.43, 7.38] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.57, 7.29] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [5.06, 7.30] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.57, 7.32] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.33] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.70, 14.30] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.62, 12.22] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.54, 13.02] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.01, 12.93] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.09] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.10, 13.48] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.50, 14.21] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.10, 12.00] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.43, 11.94] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 18.19] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [13.15, 15.24] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [14.90, 18.10] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [14.86, 18.26] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [14.17, 17.30] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.32] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [9.89, 12.81] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.58, 13.32] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.72, 12.29] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [10.58, 13.37] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.23] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.82, 14.40] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.59, 11.99] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.06, 12.04] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.55, 12.02] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-pace-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.46] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.15, 4.44] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.18, 4.20] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.42] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.63] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.43, 12.16] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.45, 10.92] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [8.57, 10.62] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.75, 10.94] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.62] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 3 fail(s)
    - Exec time: [8.45, 8.93] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 3 fail(s)
    - Exec time: [8.40, 8.85] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.39, 8.53] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [8.84, 10.90] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.61] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.49, 10.75] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.43, 10.62] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [8.57, 10.63] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.42, 12.44] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.47] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.03, 13.77] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 14.36] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [13.13, 13.94] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 13.97] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.90] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.56, 19.98] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.57, 23.62] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.53, 13.56] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.56, 23.55] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.13] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.83, 13.75] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.82, 13.96] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.98, 13.96] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.46, 12.99] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.01] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.72, 13.66] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.69, 13.78] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.89, 13.76] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.67, 13.75] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.56] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.37, 12.59] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.92, 12.71] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [11.04, 11.42] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.80, 11.48] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.58] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.84, 12.03] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.89, 12.09] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.26, 11.51] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.88, 11.96] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 12.88] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.56, 13.53] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.95, 13.24] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [11.73, 12.87] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.65, 13.22] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.21] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.18, 11.64] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.29, 13.30] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.52, 12.18] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.36, 13.21] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.58] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.82, 11.49] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.06, 13.65] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.02, 11.85] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 11.72] s

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
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.01] s

  * igt@gem_exec_schedule@fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.00, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - Statuses : 2 dmesg-warn(s) 3 pass(s)
    - Exec time: [2.01, 2.04] s

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.00, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [2.00, 2.01] s

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.00, 2.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_5222_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][12] -> [WARN][13] ([i915#1519])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@active:
    - shard-tglb:         [PASS][14] -> [DMESG-FAIL][15] ([i915#666])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb2/igt@i915_selftest@live@active.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb2/igt@i915_selftest@live@active.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-hsw:          [PASS][16] -> [DMESG-WARN][17] ([i915#1982]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-iclb:         [PASS][18] -> [DMESG-WARN][19] ([i915#1982])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#1982]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#2346])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#52] / [i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][26] -> [INCOMPLETE][27] ([i915#2055])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#49])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#1982]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-tglb:         [PASS][32] -> [DMESG-WARN][33] ([i915#1982]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#1635] / [i915#1982]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-apl4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-apl8/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#1542])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb4/igt@perf@polling-parameterized.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb6/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [INCOMPLETE][40] ([i915#2283] / [i915#2405]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk5/igt@device_reset@unbind-reset-rebind.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk1/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [INCOMPLETE][42] ([i915#1635] / [i915#2283] / [i915#2405]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-apl1/igt@device_reset@unbind-reset-rebind.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-apl6/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [INCOMPLETE][44] ([i915#2283] / [i915#2405]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-kbl7/igt@device_reset@unbind-reset-rebind.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [INCOMPLETE][46] ([i915#1602] / [i915#750]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb8/igt@device_reset@unbind-reset-rebind.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb8/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [INCOMPLETE][48] ([i915#2283] / [i915#2405]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb8/igt@device_reset@unbind-reset-rebind.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb4/igt@device_reset@unbind-reset-rebind.html

  * {igt@gem_exec_capture@pi@bcs0}:
    - shard-iclb:         [INCOMPLETE][50] ([i915#2369] / [i915#2502]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb5/igt@gem_exec_capture@pi@bcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb3/igt@gem_exec_capture@pi@bcs0.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [DMESG-WARN][52] ([i915#118] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk6/igt@gem_exec_whisper@basic-fds-forked.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-iclb:         [DMESG-WARN][54] -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb6/igt@i915_pm_backlight@fade_with_suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][56] ([i915#454]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [57]: https://intel-gfx-ci.01.org/tree/d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/index.html

--===============2572861190044584322==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_schedule: Try to spot unfairness (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/77887/">https://patchwork.freedesktop.org/series/77887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9385_full -&gt; IGTPW_5222_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5222_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5222_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5222_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb1/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb8/igt@gem_exec_schedule@fair-none-ping@rcs0.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-kbl2/igt@gem_exec_schedule@fair-none-solo@rcs0.html">FAIL</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo@vecs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk6/igt@gem_exec_schedule@fair-pace-solo@vecs0.html">FAIL</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb7/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html">FAIL</a> +29 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb6/igt@gem_exec_schedule@fair-throttle@rcs0.html">FAIL</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw7/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw8/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-idle:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9385_full and IGTPW_5222_full:</p>
<h3>New IGT tests (170)</h3>
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
<li>Exec time: [2.13, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.16, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.14, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.21] s</li>
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
<li>Exec time: [0.0, 13.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.87, 13.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.11, 13.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.99, 13.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.98, 13.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.12, 14.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.05, 13.96] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.50, 16.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.51, 16.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.55, 13.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.03, 16.02] s</li>
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
<li>Exec time: [2.14, 4.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.16, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.14, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.22] s</li>
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
<li>Exec time: [0.0, 13.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.89, 13.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.13, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.96, 13.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.09, 13.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.97, 13.89] s</li>
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
<p>igt@gem_exec_schedule@fair-none-ping@bcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 7.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.43, 7.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.57, 7.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [5.06, 7.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.57, 7.32] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.70, 14.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.62, 12.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.54, 13.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.01, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.10, 13.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.50, 14.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.10, 12.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.43, 11.94] s</li>
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
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 18.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [13.15, 15.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [14.90, 18.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.86, 18.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [14.17, 17.30] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [9.89, 12.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.58, 13.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.72, 12.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [10.58, 13.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.82, 14.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.59, 11.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.06, 12.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.55, 12.02] s</li>
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
<li>Exec time: [0.0, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.13, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.15, 4.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.18, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.42] s</li>
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
<li>Exec time: [0.0, 10.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.43, 12.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.45, 10.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [8.57, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.75, 10.94] s</li>
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
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [8.45, 8.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [8.40, 8.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.39, 8.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [8.84, 10.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.49, 10.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.43, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [8.57, 10.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.42, 12.44] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.03, 13.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.94, 14.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [13.13, 13.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.94, 13.97] s</li>
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
<li>Exec time: [0.0, 12.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.56, 19.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.57, 23.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.53, 13.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.56, 23.55] s</li>
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
<li>Exec time: [0.0, 13.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.83, 13.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.82, 13.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.98, 13.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.46, 12.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.72, 13.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.69, 13.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.89, 13.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.67, 13.75] s</li>
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
<li>Exec time: [0.0, 11.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.37, 12.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.92, 12.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [11.04, 11.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.80, 11.48] s</li>
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
<li>Exec time: [0.0, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.84, 12.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.89, 12.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [11.26, 11.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.88, 11.96] s</li>
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
<li>Exec time: [0.0, 12.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.56, 13.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.95, 13.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [11.73, 12.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.65, 13.22] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.18, 11.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.29, 13.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [11.52, 12.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.36, 13.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.82, 11.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.06, 13.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [11.02, 11.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 11.72] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
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
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.00, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 3 pass(s)</li>
<li>Exec time: [2.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.00, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.00, 2.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.00, 2.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5222_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb2/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb2/igt@i915_selftest@live@active.html">DMESG-FAIL</a> ([i915#666])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-farfromfence.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-apl4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-apl8/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb4/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb6/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk5/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#2283] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk1/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-apl1/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#1635] / [i915#2283] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-apl6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-kbl7/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#2283] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-tglb8/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#1602] / [i915#750]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-tglb8/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#2283] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb4/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@bcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb5/igt@gem_exec_capture@pi@bcs0.html">INCOMPLETE</a> ([i915#2369] / [i915#2502]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb3/igt@gem_exec_capture@pi@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-glk6/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb6/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5222/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9385/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/d">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============2572861190044584322==--

--===============1836344328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1836344328==--
