Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 14 Dec 2020 13:55:59 -0000
Message-ID: <160795415992.28164.13081434160082312425@emeril.freedesktop.org>
References: <20201214105123.542518-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201214105123.542518-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_i915/perf=5Fpmu=3A_Verify_RC6_?=
 =?utf-8?q?measurements_before/after_suspend?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1545205488=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1545205488==
Content-Type: multipart/alternative;
 boundary="===============1857829582687745104=="

--===============1857829582687745104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] i915/perf_pmu: Verify RC6 measurements before/after suspend
URL   : https://patchwork.freedesktop.org/series/84902/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5892_full -> IGTPW_5285_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5285_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5285_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5285_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb4/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb5/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-pace-share@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk6/igt@gem_exec_schedule@fair-pace-share@vcs0.html

  * {igt@gem_exec_schedule@fair-pace-solo@vcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +11 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl2/igt@gem_exec_schedule@fair-pace-solo@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +40 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb1/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +30 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb1/igt@gem_exec_schedule@fair-throttle@vcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb8/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  
New tests
---------

  New tests have been introduced between IGT_5892_full and IGTPW_5285_full:

### New IGT tests (191) ###

  * igt@gem_exec_balancer@fairslice:
    - Statuses : 1 fail(s) 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.15] s

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
    - Exec time: [2.13, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.16, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.16, 4.22] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.14] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.65, 13.10] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.65, 13.09] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.18, 13.13] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.63, 13.13] s

  * igt@gem_exec_schedule@fair-flow-solo:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.87] s

  * igt@gem_exec_schedule@fair-flow-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.93, 11.63] s

  * igt@gem_exec_schedule@fair-flow-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 11.76] s

  * igt@gem_exec_schedule@fair-flow-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.64, 11.38] s

  * igt@gem_exec_schedule@fair-flow-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 11.77] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.11] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.07] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.10] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.19, 13.09] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.07] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.43] s

  * igt@gem_exec_schedule@fair-half-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.49, 15.79] s

  * igt@gem_exec_schedule@fair-half-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.56, 15.56] s

  * igt@gem_exec_schedule@fair-half-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.61, 13.50] s

  * igt@gem_exec_schedule@fair-half-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.53, 15.38] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.47] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.07, 13.70] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.12, 13.51] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [9.16, 13.59] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.12, 13.54] s

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
    - Exec time: [2.13, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.17, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.15, 4.23] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.12] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.60, 13.10] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.13] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [8.59, 13.11] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.62, 13.12] s

  * igt@gem_exec_schedule@fair-next-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.87] s

  * igt@gem_exec_schedule@fair-next-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.62, 15.39] s

  * igt@gem_exec_schedule@fair-next-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.64, 11.66] s

  * igt@gem_exec_schedule@fair-next-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.64, 11.37] s

  * igt@gem_exec_schedule@fair-next-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.93, 11.66] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.44] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 13.32] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.04, 13.48] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.25, 13.11] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.04, 13.50] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 5.05] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.42, 5.03] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.54, 5.37] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.62, 4.82] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.55, 5.26] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.91] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.10, 11.75] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.06, 12.54] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.03, 12.55] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.99, 11.98] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.15] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.12, 12.16] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.53, 11.99] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.55, 9.99] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.53, 12.01] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 14.18] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [10.72, 14.60] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [11.88, 17.26] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [13.33, 14.96] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [11.87, 16.72] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.00] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.87, 12.67] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.92, 13.62] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.71, 10.71] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.69, 13.55] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.15] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.44, 11.97] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.54, 10.74] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.48, 10.13] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.57, 11.90] s

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
    - Exec time: [2.10, 4.18] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.11, 4.17] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.12, 4.18] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.18] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.63] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.50, 10.91] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.40, 10.59] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.56, 10.59] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.40, 10.57] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.62] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.47, 10.86] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.53, 10.64] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [10.61, 10.89] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.59, 10.63] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.65] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.60, 12.76] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.60, 10.66] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [6.42, 10.66] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.44, 10.64] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.08] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.03, 13.11] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.60, 13.05] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.18, 13.09] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.61, 13.05] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.55] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.70, 11.64] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.64, 11.58] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.50, 10.89] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.67, 11.64] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.01] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.84, 12.98] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.79, 12.99] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.97, 12.96] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.87, 12.97] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.94] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.51, 12.93] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.68, 12.92] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.58, 12.94] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.69, 12.93] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 8.99] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.56, 11.06] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.72, 9.21] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.66, 8.97] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.66, 9.27] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.27] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.85, 11.08] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.94, 11.63] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [8.93, 11.74] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.81, 11.59] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 12.85] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.21, 12.72] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [11.95, 13.54] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.84, 13.03] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [11.90, 12.83] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 11.65] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [9.07, 12.74] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [9.35, 11.98] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [9.09, 9.21] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [9.26, 11.42] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 11.55] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.83, 12.58] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.02, 11.98] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [8.98, 11.66] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.91, 11.92] s

  * igt@gem_exec_schedule@fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.12] s

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
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@u-fairslice:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-fairslice-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.04] s

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - Statuses : 1 dmesg-warn(s) 4 pass(s)
    - Exec time: [2.01, 2.04] s

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.06] s

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - Statuses : 1 dmesg-warn(s) 4 pass(s)
    - Exec time: [2.02, 2.03] s

  * igt@perf_pmu@rc6-suspend:
    - Statuses : 7 pass(s)
    - Exec time: [7.72, 8.97] s

  

Known issues
------------

  Here are the changes found in IGTPW_5285_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#658])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@feature_discovery@psr2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk1/igt@gem_ctx_shared@q-smoketest-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk6/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb1/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html

  * {igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271]) +105 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl7/igt@gem_exec_schedule@fair-flow-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-flow-solo@bcs0} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271]) +58 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-apl1/igt@gem_exec_schedule@fair-flow-solo@bcs0.html

  * {igt@gem_exec_schedule@fair-next-ping@vcs1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109276]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb4/igt@gem_exec_schedule@fair-next-ping@vcs1.html

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271]) +51 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk7/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-vip} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][25] ([fdo#109271]) +34 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-snb2/igt@gem_exec_schedule@fair-none-vip.html

  * {igt@gem_exec_schedule@fair-pace-solo} (NEW):
    - shard-hsw:          NOTRUN -> [SKIP][26] ([fdo#109271]) +39 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-hsw4/igt@gem_exec_schedule@fair-pace-solo.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gen3_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb2/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#112306])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][30] ([i915#2681] / [i915#2684])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [WARN][31] ([i915#2684])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-kbl:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl6/igt@i915_pm_rpm@fences-dpms.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl6/igt@i915_pm_rpm@fences-dpms.html
    - shard-hsw:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw6/igt@i915_pm_rpm@fences-dpms.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-hsw5/igt@i915_pm_rpm@fences-dpms.html
    - shard-glk:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk7/igt@i915_pm_rpm@fences-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk4/igt@i915_pm_rpm@fences-dpms.html
    - shard-apl:          [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl2/igt@i915_pm_rpm@fences-dpms.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-apl4/igt@i915_pm_rpm@fences-dpms.html
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([i915#579]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb7/igt@i915_pm_rpm@fences-dpms.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb6/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [PASS][42] -> [SKIP][43] ([i915#579]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb7/igt@i915_pm_rpm@modes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/index.html

--===============1857829582687745104==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] i915/perf_pmu: Verify RC6 measurements before/after suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84902/">https://patchwork.freedesktop.org/series/84902/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5892_full -&gt; IGTPW_5285_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5285_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5285_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5285_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb4/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb5/igt@gem_exec_schedule@fair-none-ping@rcs0.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-share@vcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk6/igt@gem_exec_schedule@fair-pace-share@vcs0.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo@vcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl2/igt@gem_exec_schedule@fair-pace-solo@vcs0.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb1/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html">FAIL</a> +40 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb1/igt@gem_exec_schedule@fair-throttle@vcs0.html">FAIL</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb8/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb6/igt@i915_pm_dc@dc5-psr.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb7/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb7/igt@i915_pm_dc@dc5-psr.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5892_full and IGTPW_5285_full:</p>
<h3>New IGT tests (191)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.15] s</li>
</ul>
</li>
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
<li>Exec time: [2.13, 4.21] s</li>
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
<li>Exec time: [2.16, 4.22] s</li>
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
<li>Exec time: [0.0, 13.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.65, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.65, 13.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.18, 13.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.63, 13.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.93, 11.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 11.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.64, 11.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.94, 11.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.19, 13.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.07] s</li>
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
<li>Exec time: [0.0, 13.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.49, 15.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.56, 15.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.61, 13.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.53, 15.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.07, 13.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.12, 13.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.16, 13.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.12, 13.54] s</li>
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
<li>Exec time: [2.13, 4.22] s</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.15, 4.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.21] s</li>
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
<li>Exec time: [0.0, 13.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.60, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [8.59, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.62, 13.12] s</li>
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
<li>Exec time: [0.0, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.62, 15.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.64, 11.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.64, 11.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.93, 11.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.94, 13.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.04, 13.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.25, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.04, 13.50] s</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 5.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.42, 5.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.54, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.62, 4.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.55, 5.26] s</li>
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
<li>Exec time: [0.0, 11.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.10, 11.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.06, 12.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.03, 12.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.99, 11.98] s</li>
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
<li>Exec time: [0.0, 12.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.12, 12.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.53, 11.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.55, 9.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.53, 12.01] s</li>
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
<li>Exec time: [0.0, 14.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [10.72, 14.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [11.88, 17.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [13.33, 14.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [11.87, 16.72] s</li>
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
<li>Exec time: [0.0, 13.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.87, 12.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.92, 13.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.71, 10.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.69, 13.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.44, 11.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.54, 10.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.48, 10.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.57, 11.90] s</li>
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
<li>Exec time: [2.10, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.11, 4.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.12, 4.18] s</li>
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
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.50, 10.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.40, 10.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.56, 10.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.40, 10.57] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.47, 10.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.53, 10.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [10.61, 10.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.59, 10.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.60, 12.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.60, 10.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [6.42, 10.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.44, 10.64] s</li>
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
<p>igt@gem_exec_schedule@fair-spare@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.03, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.60, 13.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.18, 13.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.61, 13.05] s</li>
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
<li>Exec time: [0.0, 10.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.70, 11.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.64, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.50, 10.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.67, 11.64] s</li>
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
<li>Exec time: [0.0, 13.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.84, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.79, 12.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.97, 12.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.87, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.51, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.68, 12.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.58, 12.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.69, 12.93] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 8.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.56, 11.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.72, 9.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.66, 8.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.66, 9.27] s</li>
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
<li>Exec time: [0.0, 11.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.85, 11.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.94, 11.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [8.93, 11.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.81, 11.59] s</li>
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
<li>Exec time: [0.0, 12.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.21, 12.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [11.95, 13.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [11.84, 13.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [11.90, 12.83] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 11.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [9.07, 12.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [9.35, 11.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [9.09, 9.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [9.26, 11.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.83, 12.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.02, 11.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [8.98, 11.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.91, 11.92] s</li>
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
<li>Exec time: [0.0, 2.12] s</li>
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
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 4 pass(s)</li>
<li>Exec time: [2.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 4 pass(s)</li>
<li>Exec time: [2.02, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [7.72, 8.97] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5285_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk1/igt@gem_ctx_shared@q-smoketest-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk6/igt@gem_ctx_shared@q-smoketest-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb1/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl7/igt@gem_exec_schedule@fair-flow-ping@rcs0.html">SKIP</a> ([fdo#109271]) +105 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-flow-solo@bcs0} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-apl1/igt@gem_exec_schedule@fair-flow-solo@bcs0.html">SKIP</a> ([fdo#109271]) +58 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vcs1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb4/igt@gem_exec_schedule@fair-next-ping@vcs1.html">SKIP</a> ([fdo#109276]) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk7/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> ([fdo#109271]) +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-vip} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-snb2/igt@gem_exec_schedule@fair-none-vip.html">SKIP</a> ([fdo#109271]) +34 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-hsw4/igt@gem_exec_schedule@fair-pace-solo.html">SKIP</a> ([fdo#109271]) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb2/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb7/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl6/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-kbl6/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw6/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-hsw5/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk7/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-glk4/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl2/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-apl4/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb7/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-iclb6/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([i915#579]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5285/shard-tglb7/igt@i915_pm_rpm@modes">SKIP</a> ([i915#579]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1857829582687745104==--

--===============1545205488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1545205488==--
