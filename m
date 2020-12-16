Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Dec 2020 20:37:39 -0000
Message-ID: <160815105952.16511.9024709953358948234@emeril.freedesktop.org>
References: <20201216152456.1304749-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201216152456.1304749-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev14=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0736505453=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0736505453==
Content-Type: multipart/alternative;
 boundary="===============2638045345249219162=="

--===============2638045345249219162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_schedule: Try to spot unfairness (rev14)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9493_full -> IGTPW_5299_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5299_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5299_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5299_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb8/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb3/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-pace-share@vecs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk3/igt@gem_exec_schedule@fair-pace-share@vecs0.html

  * {igt@gem_exec_schedule@fair-pace-solo@vcs1} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +11 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl4/igt@gem_exec_schedule@fair-pace-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +55 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb1/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +28 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb4/igt@gem_exec_schedule@fair-throttle@vcs0.html

  * igt@kms_flip@flip-vs-panning-interruptible@b-vga1:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-hsw7/igt@kms_flip@flip-vs-panning-interruptible@b-vga1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw4/igt@kms_flip@flip-vs-panning-interruptible@b-vga1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9493_full and IGTPW_5299_full:

### New IGT tests (174) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.22] s

  * igt@gem_exec_schedule@fair-flow-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.16, 4.22] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.16, 4.23] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.22] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.10] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.58, 13.06] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.03, 13.06] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.89, 13.07] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.03, 13.10] s

  * igt@gem_exec_schedule@fair-flow-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.45] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.98, 13.34] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.46] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.13, 13.12] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.82, 13.49] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.51] s

  * igt@gem_exec_schedule@fair-half-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.50, 15.31] s

  * igt@gem_exec_schedule@fair-half-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.51, 15.47] s

  * igt@gem_exec_schedule@fair-half-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.49, 13.38] s

  * igt@gem_exec_schedule@fair-half-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.59, 15.42] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.44] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.96, 13.58] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.04, 13.40] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [9.03, 13.37] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.73] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-next-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.25] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.11, 4.21] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.14, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.15, 4.21] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.04] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.98, 13.04] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.04] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.13, 13.05] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.05] s

  * igt@gem_exec_schedule@fair-next-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.86] s

  * igt@gem_exec_schedule@fair-next-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.94, 11.53] s

  * igt@gem_exec_schedule@fair-next-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 13.89] s

  * igt@gem_exec_schedule@fair-next-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.66, 11.28] s

  * igt@gem_exec_schedule@fair-next-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 13.82] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.06] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.64, 13.06] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.63, 13.07] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.12, 13.06] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.63, 13.06] s

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
    - Exec time: [2.39, 5.04] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.56, 5.52] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.67, 4.81] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.53, 5.38] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.92] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.46, 11.75] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [6.91, 12.39] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [6.63, 12.45] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.09, 12.03] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 9.73] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.09, 12.17] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.49, 11.95] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [9.51, 10.05] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.54, 10.44] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 14.20] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [10.56, 14.11] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [11.95, 18.59] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [13.36, 18.73] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [12.03, 17.14] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.98] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.77, 12.67] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.91, 13.67] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.69, 10.66] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.68, 13.02] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.07] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.45, 12.22] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.59, 11.02] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.22, 11.92] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [7.63, 10.91] s

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
    - Exec time: [2.09, 4.44] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.11, 4.39] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.14, 4.18] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.39] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.61] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.50, 11.86] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.39, 11.74] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.59, 10.58] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.56, 10.63] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.59] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.58, 10.61] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.61, 10.62] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [8.59, 10.60] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.61, 10.62] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.62] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.50, 12.24] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.39, 10.62] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [10.63, 10.91] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.42, 10.91] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.83] s

  * igt@gem_exec_schedule@fair-spare-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.92, 11.70] s

  * igt@gem_exec_schedule@fair-spare-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 13.92] s

  * igt@gem_exec_schedule@fair-spare-solo@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.74, 13.92] s

  * igt@gem_exec_schedule@fair-spare-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.90, 11.75] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.37] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.81, 13.32] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.13] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.21, 13.11] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.05, 13.43] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.97] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.73, 12.97] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.80, 12.96] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.00, 12.98] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.64, 12.98] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.91] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.71, 12.88] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.66, 12.90] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.80, 12.89] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.65, 12.88] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 8.79] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.70, 12.41] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.78, 9.21] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [8.73, 8.89] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.71, 9.12] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.43] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.03, 12.79] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.03, 11.38] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [9.13, 11.10] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.76, 11.51] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 13.21] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.30, 12.61] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [11.97, 13.08] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [11.83, 12.84] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [11.95, 13.17] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 9.77] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.07, 11.71] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.21, 12.89] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [9.25, 9.82] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.22, 12.01] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 11.44] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.88, 12.97] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.95, 11.52] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [8.96, 11.75] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.08, 11.77] s

  * igt@kms_atomic_transition@modeset-transition:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5299_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#112283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb5/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#112283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb2/igt@gem_exec_params@secure-non-master.html

  * {igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [SKIP][11] ([fdo#109271]) +90 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl3/igt@gem_exec_schedule@fair-flow-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-flow-ping@vcs1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109276])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb4/igt@gem_exec_schedule@fair-flow-ping@vcs1.html

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271]) +49 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk4/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-vip} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271]) +29 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-snb6/igt@gem_exec_schedule@fair-none-vip.html

  * {igt@gem_exec_schedule@fair-pace-share@bcs0} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271]) +60 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-apl4/igt@gem_exec_schedule@fair-pace-share@bcs0.html

  * {igt@gem_exec_schedule@fair-pace-solo} (NEW):
    - shard-hsw:          NOTRUN -> [SKIP][16] ([fdo#109271]) +44 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw8/igt@gem_exec_schedule@fair-pace-solo.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - shard-kbl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#1699]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl2/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#454])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#579])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-iclb3/igt@i915_pm_rpm@reg-read-ioctl.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb8/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-hsw:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-hsw1/igt@i915_pm_rpm@reg-read-ioctl.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw2/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#579])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb2/igt@i915_pm_rpm@reg-read-ioctl.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb6/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-kbl:          [PASS][28] -> [SKIP][29] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-kbl6/igt@i915_pm_rpm@reg-read-ioctl.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl7/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-apl:          [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-apl8/igt@i915_pm_rpm@reg-read-ioctl.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-apl6/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-glk:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-glk2/igt@i915_pm_rpm@reg-read-ioctl.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk3/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111615]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110723])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-hsw:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw8/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#72])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][40] -> [FAIL][41] ([i915#2370])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:
    - shard-snb:          [PASS][42] -> [SKIP][43] ([fdo#109271]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109274]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#2122])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#2598])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#79])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#2672])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/s

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/index.html

--===============2638045345249219162==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_schedule: Try to spot unfairness (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/77887/">https://patchwork.freedesktop.org/series/77887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9493_full -&gt; IGTPW_5299_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5299_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5299_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5299_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb8/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb3/igt@gem_exec_schedule@fair-none-ping@rcs0.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-share@vecs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk3/igt@gem_exec_schedule@fair-pace-share@vecs0.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo@vcs1} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl4/igt@gem_exec_schedule@fair-pace-solo@vcs1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb1/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html">FAIL</a> +55 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@vcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb4/igt@gem_exec_schedule@fair-throttle@vcs0.html">FAIL</a> +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-hsw7/igt@kms_flip@flip-vs-panning-interruptible@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw4/igt@kms_flip@flip-vs-panning-interruptible@b-vga1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9493_full and IGTPW_5299_full:</p>
<h3>New IGT tests (174)</h3>
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
<li>Exec time: [0.0, 4.22] s</li>
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
<li>Exec time: [2.16, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.16, 4.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.22] s</li>
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
<li>Exec time: [0.0, 13.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.58, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.03, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.89, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.03, 13.10] s</li>
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
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.98, 13.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.13, 13.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.82, 13.49] s</li>
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
<li>Exec time: [0.0, 13.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.50, 15.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.51, 15.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.49, 13.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.59, 15.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.96, 13.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.04, 13.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.03, 13.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.73] s</li>
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
<li>Exec time: [0.0, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.14, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.11, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.14, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.15, 4.21] s</li>
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
<li>Exec time: [0.0, 13.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.98, 13.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.13, 13.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.05] s</li>
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
<li>Exec time: [8.94, 11.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 13.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.66, 11.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 13.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.64, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.63, 13.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.12, 13.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.63, 13.06] s</li>
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
<li>Exec time: [2.39, 5.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.56, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.67, 4.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.53, 5.38] s</li>
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
<li>Exec time: [0.0, 11.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.46, 11.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [6.91, 12.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [6.63, 12.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.09, 12.03] s</li>
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
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 9.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.09, 12.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.49, 11.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [9.51, 10.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.54, 10.44] s</li>
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
<li>Exec time: [0.0, 14.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [10.56, 14.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [11.95, 18.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [13.36, 18.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [12.03, 17.14] s</li>
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
<li>Exec time: [0.0, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.77, 12.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.91, 13.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.69, 10.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.68, 13.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.45, 12.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.59, 11.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.22, 11.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [7.63, 10.91] s</li>
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
<li>Exec time: [2.09, 4.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.11, 4.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.14, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.12, 4.39] s</li>
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
<li>Exec time: [0.0, 10.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.50, 11.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.39, 11.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.59, 10.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.56, 10.63] s</li>
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
<li>Exec time: [0.0, 10.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.58, 10.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.61, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [8.59, 10.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.61, 10.62] s</li>
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
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.50, 12.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.39, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [10.63, 10.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.42, 10.91] s</li>
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
<li>Exec time: [0.0, 10.83] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.92, 11.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.89, 13.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.74, 13.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.90, 11.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.81, 13.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.21, 13.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.05, 13.43] s</li>
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
<li>Exec time: [0.0, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.73, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.80, 12.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.00, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.64, 12.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.71, 12.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.66, 12.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.80, 12.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.65, 12.88] s</li>
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
<li>Exec time: [0.0, 8.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.70, 12.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.78, 9.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [8.73, 8.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.71, 9.12] s</li>
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
<li>Exec time: [0.0, 11.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.03, 12.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.03, 11.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [9.13, 11.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.76, 11.51] s</li>
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
<li>Exec time: [0.0, 13.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.30, 12.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [11.97, 13.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [11.83, 12.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [11.95, 13.17] s</li>
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
<li>Exec time: [0.0, 9.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.07, 11.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.21, 12.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [9.25, 9.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.22, 12.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.88, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.95, 11.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [8.96, 11.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.08, 11.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5299_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb5/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb2/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-flow-ping@rcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl3/igt@gem_exec_schedule@fair-flow-ping@rcs0.html">SKIP</a> ([fdo#109271]) +90 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-flow-ping@vcs1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb4/igt@gem_exec_schedule@fair-flow-ping@vcs1.html">SKIP</a> ([fdo#109276])</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk4/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> ([fdo#109271]) +49 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-vip} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-snb6/igt@gem_exec_schedule@fair-none-vip.html">SKIP</a> ([fdo#109271]) +29 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-share@bcs0} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-apl4/igt@gem_exec_schedule@fair-pace-share@bcs0.html">SKIP</a> ([fdo#109271]) +60 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-solo} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw8/igt@gem_exec_schedule@fair-pace-solo.html">SKIP</a> ([fdo#109271]) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@uc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl2/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-iclb3/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb8/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-hsw1/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw2/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb2/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb6/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-kbl6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl7/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-apl8/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-apl6/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-glk2/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk3/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw8/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html">SKIP</a> ([fdo#109271]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-iclb7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9493/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5299/s">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2638045345249219162==--

--===============0736505453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0736505453==--
