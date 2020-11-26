Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Nov 2020 14:18:45 -0000
Message-ID: <160640032501.4112.1529842785768565241@emeril.freedesktop.org>
References: <20201126110842.680720-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201126110842.680720-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev11=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1846796077=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1846796077==
Content-Type: multipart/alternative;
 boundary="===============8152371483247866201=="

--===============8152371483247866201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev11)
URL   : https://patchwork.freedesktop.org/series/77887/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9393_full -> IGTPW_5229_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5229_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5229_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5229_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb2/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-next-share@vecs0} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][2] +97 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb1/igt@gem_exec_schedule@fair-next-share@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +19 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb8/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +68 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-kbl4/igt@gem_exec_schedule@fair-none-solo@rcs0.html

  * {igt@gem_exec_schedule@fair-pace@rcs0} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][5] +34 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-apl8/igt@gem_exec_schedule@fair-pace@rcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +47 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk7/igt@gem_exec_schedule@fair-throttle-solo@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][7] +61 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb6/igt@gem_exec_schedule@fair-throttle@vcs0.html

  * {igt@gem_exec_schedule@u-fairslice@bcs0} (NEW):
    - shard-iclb:         NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb2/igt@gem_exec_schedule@u-fairslice@bcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][10] ([i915#1804]) -> [WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9393_full and IGTPW_5229_full:

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
    - Exec time: [2.13, 4.42] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.14, 4.22] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.15, 4.21] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.61] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.33, 9.07] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.34, 11.97] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [6.34, 8.77] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.33, 11.19] s

  * igt@gem_exec_schedule@fair-flow-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.84] s

  * igt@gem_exec_schedule@fair-flow-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.32, 10.87] s

  * igt@gem_exec_schedule@fair-flow-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.28, 16.33] s

  * igt@gem_exec_schedule@fair-flow-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [6.29, 11.25] s

  * igt@gem_exec_schedule@fair-flow-solo@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.31, 11.71] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.59] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.37, 8.99] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.33, 9.06] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.32, 6.55] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.32, 11.21] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.59] s

  * igt@gem_exec_schedule@fair-half-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.61, 16.01] s

  * igt@gem_exec_schedule@fair-half-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.61, 15.66] s

  * igt@gem_exec_schedule@fair-half-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.64, 13.41] s

  * igt@gem_exec_schedule@fair-half-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.64, 15.67] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.68] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.99, 13.60] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.96, 13.53] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [9.00, 13.49] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.70, 11.99] s

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
    - Exec time: [2.11, 4.21] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.16, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.64] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.35, 8.97] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.34, 9.37] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.34, 8.73] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.34, 11.21] s

  * igt@gem_exec_schedule@fair-next-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-solo@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.71] s

  * igt@gem_exec_schedule@fair-next-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.62, 11.77] s

  * igt@gem_exec_schedule@fair-next-solo@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.29, 16.86] s

  * igt@gem_exec_schedule@fair-next-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [6.29, 11.26] s

  * igt@gem_exec_schedule@fair-next-solo@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.36, 8.87] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.87] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.34, 10.87] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.33, 11.11] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.34, 8.80] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.33, 11.13] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 5.02] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.47, 5.01] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.58, 5.51] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [4.82, 5.23] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.57, 5.46] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.83] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.68, 7.12] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [6.60, 6.97] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [6.62, 6.92] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [6.62, 7.03] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 8.33] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [7.90, 10.28] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [7.91, 12.04] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [7.96, 8.74] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [7.95, 8.80] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 7.79] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [7.23, 7.75] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [7.26, 7.94] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [7.27, 7.87] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [7.28, 7.95] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 7.31] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 3 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [7.07, 10.07] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [7.08, 7.68] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [7.08, 7.48] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [7.07, 7.59] s

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
    - Exec time: [2.11, 4.21] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.11, 4.20] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.21] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.31] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.31, 6.63] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.29, 6.46] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.29, 6.40] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.28, 6.45] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 8.40] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.29, 8.97] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.42, 8.71] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [8.39, 8.55] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.26, 8.84] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 8.44] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.27, 8.99] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.29, 6.53] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [6.29, 6.38] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.30, 6.49] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.56] s

  * igt@gem_exec_schedule@fair-spare-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.84, 11.69] s

  * igt@gem_exec_schedule@fair-spare-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.61, 11.76] s

  * igt@gem_exec_schedule@fair-spare-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [6.72, 10.72] s

  * igt@gem_exec_schedule@fair-spare-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [6.36, 11.77] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.09] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.36, 11.12] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [6.35, 11.14] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.28, 13.10] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.58, 11.16] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.51] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.68, 11.85] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.65, 11.81] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.53, 10.81] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.58, 11.88] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.41] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.34, 10.66] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.30, 10.64] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [6.30, 10.97] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.29, 8.66] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 3 fail(s)
    - Exec time: [6.44, 6.59] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 3 fail(s)
    - Exec time: [6.34, 6.41] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [6.34] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [6.38, 10.82] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.58] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.45, 6.69] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.45, 6.54] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [6.37, 6.44] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.41, 6.68] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.60] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.61, 6.77] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.51, 6.68] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.58] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.51, 6.74] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 7.56] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.71, 7.03] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.83, 7.71] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.89, 7.42] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [5.20, 7.56] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 7.39] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.67, 6.98] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.80, 7.39] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.84, 7.02] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.65, 7.37] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.78] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.41, 6.86] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.55, 6.73] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [6.66, 6.89] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.58, 6.86] s

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
    - Statuses : 2 pass(s)
    - Exec time: [2.01] s

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
    - Statuses : 1 dmesg-warn(s) 4 pass(s)
    - Exec time: [2.00, 2.04] s

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - Statuses : 1 dmesg-warn(s) 4 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.00, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [2.00, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.00, 2.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_5229_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@engines@rcs0:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#118] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk4/igt@gem_exec_gttfill@engines@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk5/igt@gem_exec_gttfill@engines@rcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-hsw:          [PASS][14] -> [INCOMPLETE][15] ([i915#1888] / [i915#2637])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-hsw4/igt@gem_exec_suspend@basic-s0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-hsw8/igt@gem_exec_suspend@basic-s0.html
    - shard-iclb:         [PASS][16] -> [INCOMPLETE][17] ([i915#1090] / [i915#1185])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb5/igt@gem_exec_suspend@basic-s0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb6/igt@gem_exec_suspend@basic-s0.html
    - shard-glk:          [PASS][18] -> [INCOMPLETE][19] ([i915#2635]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk6/igt@gem_exec_suspend@basic-s0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk7/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-tglb:         [PASS][20] -> [DMESG-WARN][21] ([i915#1982]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-tglb1/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#72])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1982]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +6 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-apl8/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-apl8/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#49])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#2055] / [i915#2637])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [PASS][34] -> [INCOMPLETE][35] ([i915#155]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][36] -> [INCOMPLETE][37] ([i915#2635]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-iclb:         [PASS][38] -> [INCOMPLETE][39] ([i915#1185])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [INCOMPLETE][42] ([i915#2283] / [i915#2405]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk7/igt@device_reset@unbind-reset-rebind.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk4/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [INCOMPLETE][44] ([i915#2283] / [i915#2405]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/sha

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/index.html

--===============8152371483247866201==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_schedule: Try to spot unfairness (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/77887/">https://patchwork.freedesktop.org/series/77887/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9393_full -&gt; IGTPW_5229_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5229_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5229_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5229_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb2/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-next-share@vecs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb1/igt@gem_exec_schedule@fair-next-share@vecs0.html">FAIL</a> +97 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb8/igt@gem_exec_schedule@fair-none-ping@rcs0.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-kbl4/igt@gem_exec_schedule@fair-none-solo@rcs0.html">FAIL</a> +68 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace@rcs0} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-apl8/igt@gem_exec_schedule@fair-pace@rcs0.html">FAIL</a> +34 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk7/igt@gem_exec_schedule@fair-throttle-solo@vcs0.html">FAIL</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb6/igt@gem_exec_schedule@fair-throttle@vcs0.html">FAIL</a> +61 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@bcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb2/igt@gem_exec_schedule@u-fairslice@bcs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-idle:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9393_full and IGTPW_5229_full:</p>
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
<li>Exec time: [2.13, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.14, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.15, 4.21] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 8.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.33, 9.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.34, 11.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [6.34, 8.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.33, 11.19] s</li>
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
<li>Exec time: [0.0, 10.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.32, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.28, 16.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [6.29, 11.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-solo@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.31, 11.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 8.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.37, 8.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.33, 9.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.32, 6.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.32, 11.21] s</li>
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
<li>Exec time: [0.0, 13.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.61, 16.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.61, 15.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.64, 13.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.64, 15.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.99, 13.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.96, 13.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.00, 13.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.70, 11.99] s</li>
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
<li>Exec time: [2.11, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.16, 4.22] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 8.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.35, 8.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.34, 9.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.34, 8.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.34, 11.21] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.62, 11.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.29, 16.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [6.29, 11.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [6.36, 8.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.34, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.33, 11.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.34, 8.80] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.33, 11.13] s</li>
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
<li>Exec time: [0.0, 5.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.47, 5.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.58, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [4.82, 5.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.57, 5.46] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 6.83] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.68, 7.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [6.60, 6.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [6.62, 6.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [6.62, 7.03] s</li>
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
<li>Exec time: [0.0, 8.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [7.90, 10.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [7.91, 12.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [7.96, 8.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [7.95, 8.80] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [7.23, 7.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [7.26, 7.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [7.27, 7.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [7.28, 7.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [7.07, 10.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [7.08, 7.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [7.08, 7.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [7.07, 7.59] s</li>
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
<li>Exec time: [2.11, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.11, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.13, 4.21] s</li>
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
<li>Exec time: [0.0, 6.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.31, 6.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.29, 6.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.29, 6.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.28, 6.45] s</li>
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
<li>Exec time: [0.0, 8.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [6.29, 8.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.42, 8.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [8.39, 8.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [6.26, 8.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 8.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.27, 8.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.29, 6.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [6.29, 6.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.30, 6.49] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 6.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.84, 11.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.61, 11.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [6.72, 10.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [6.36, 11.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.36, 11.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [6.35, 11.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.28, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.58, 11.16] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.68, 11.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.65, 11.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.53, 10.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.58, 11.88] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 6.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [6.34, 10.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [6.30, 10.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [6.30, 10.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [6.29, 8.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [6.44, 6.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [6.34, 6.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [6.38, 10.82] s</li>
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
<li>Exec time: [0.0, 6.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.45, 6.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.45, 6.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [6.37, 6.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.41, 6.68] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 6.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.61, 6.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.51, 6.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.51, 6.74] s</li>
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
<li>Exec time: [0.0, 7.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.71, 7.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.83, 7.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.89, 7.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [5.20, 7.56] s</li>
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
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.67, 6.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.80, 7.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.84, 7.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.65, 7.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 6.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.41, 6.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.55, 6.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [6.66, 6.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.58, 6.86] s</li>
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
<li>Statuses : 2 pass(s)</li>
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
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 4 pass(s)</li>
<li>Exec time: [2.00, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 4 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.00, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.00, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.00, 2.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5229_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk4/igt@gem_exec_gttfill@engines@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk5/igt@gem_exec_gttfill@engines@rcs0.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-hsw4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-hsw8/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> ([i915#1888] / [i915#2637])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb5/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb6/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> ([i915#1090] / [i915#1185])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk7/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> ([i915#2635]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-tglb1/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-tglb7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">DMESG-WARN</a> ([i915#1982]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-WARN</a> ([i915#1982]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-apl8/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-apl8/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#1982]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-WARN</a> ([i915#1982]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> ([i915#2055] / [i915#2637])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> ([i915#155]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> ([i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> ([i915#1185])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/shard-glk7/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#2283] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5229/shard-glk4/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9393/sha">INCOMPLETE</a> ([i915#2283] / [i915#2405]) -&gt; [PASS][45]</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8152371483247866201==--

--===============1846796077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1846796077==--
