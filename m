Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 14 Oct 2020 17:57:46 -0000
Message-ID: <160269826692.21209.3528091815220982892@emeril.freedesktop.org>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/10=5D_i915/gem=5Fuserptr=5Fblits?=
 =?utf-8?q?=3A_Tighten_has=5Fuserptr=28=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1611609310=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1611609310==
Content-Type: multipart/alternative;
 boundary="===============1462870016508230300=="

--===============1462870016508230300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/10] i915/gem_userptr_blits: Tighten has_userptr()
URL   : https://patchwork.freedesktop.org/series/82670/
State : success

== Summary ==

CI Bug Log - changes from IGT_5815_full -> IGTPW_5067_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5067_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5067_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5067_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb4/igt@gem_exec_schedule@fair-next-ping@vecs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb7/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][3] +14 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl6/igt@gem_exec_schedule@fair-none-solo@rcs0.html

  * {igt@gem_exec_schedule@fair-pace-share@vcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][4] +13 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-glk3/igt@gem_exec_schedule@fair-pace-share@vcs0.html

  * {igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +36 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb1/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html

  * {igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +29 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb2/igt@gem_exec_schedule@fair-throttle@rcs0.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [DMESG-FAIL][7] ([i915#1982]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  
New tests
---------

  New tests have been introduced between IGT_5815_full and IGTPW_5067_full:

### New IGT tests (222) ###

  * igt@gem_exec_balancer@u-bonded-cork:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.08] s

  * igt@gem_exec_balancer@u-bonded-early:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.07] s

  * igt@gem_exec_balancer@u-bonded-imm:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.10] s

  * igt@gem_exec_balancer@u-bonded-semaphore:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.30] s

  * igt@gem_exec_reloc@basic-spin-user:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-spin-user@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-spin-user@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-spin-user@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-spin-user@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_reloc@basic-spin-user@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.33] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.14, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.13, 4.21] s

  * igt@gem_exec_schedule@fair-flow-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.15, 4.24] s

  * igt@gem_exec_schedule@fair-flow-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.20] s

  * igt@gem_exec_schedule@fair-flow-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.89, 13.57] s

  * igt@gem_exec_schedule@fair-flow-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.98, 13.19] s

  * igt@gem_exec_schedule@fair-flow-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [12.99, 13.66] s

  * igt@gem_exec_schedule@fair-flow-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.99, 13.68] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.32] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.90, 13.62] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.02, 13.86] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [13.01, 13.91] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.95] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.62] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.58, 15.72] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.06, 15.68] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [9.05, 13.38] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.11, 15.85] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-next-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.38] s

  * igt@gem_exec_schedule@fair-next-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.16, 4.36] s

  * igt@gem_exec_schedule@fair-next-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [2.15, 4.22] s

  * igt@gem_exec_schedule@fair-next-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.33] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.20] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.90, 13.58] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.61] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [12.98, 13.62] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.62] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.35] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.93, 13.63] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 13.81] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [13.02, 13.98] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.01, 13.79] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 7.61] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.38, 7.50] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.55, 7.63] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [2.60, 7.44] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.52, 7.65] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.17] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [9.27, 11.90] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.01, 12.88] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.61, 12.88] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.11, 12.83] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.42] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [9.68, 12.40] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.46, 12.14] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [9.75, 12.10] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.43, 12.11] s

  * igt@gem_exec_schedule@fair-none-solo:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 14.20] s

  * igt@gem_exec_schedule@fair-none-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [13.28, 14.36] s

  * igt@gem_exec_schedule@fair-none-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [15.05, 18.04] s

  * igt@gem_exec_schedule@fair-none-solo@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [13.63, 14.95] s

  * igt@gem_exec_schedule@fair-none-solo@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [14.25, 16.86] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.21] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [10.13, 14.28] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [11.10, 13.90] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.60, 13.17] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.95, 13.91] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.45] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.77, 13.79] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.54, 12.17] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [9.80, 12.16] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [7.58, 12.17] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-ping@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-pace-ping@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.13, 4.38] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.21] s

  * igt@gem_exec_schedule@fair-pace-ping@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [4.20, 4.24] s

  * igt@gem_exec_schedule@fair-pace-ping@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [2.12, 4.24] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.0, 10.58] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [8.44, 10.61] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [8.41, 10.60] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [10.60] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [8.40, 8.80] s

  * igt@gem_exec_schedule@fair-pace-solo:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fair-pace-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.54] s

  * igt@gem_exec_schedule@fair-pace-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.50, 10.54] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [8.38, 10.54] s

  * igt@gem_exec_schedule@fair-pace-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [8.36, 8.55] s

  * igt@gem_exec_schedule@fair-pace-solo@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.59, 10.57] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 10.60] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.54, 10.61] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.41, 11.92] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [10.60, 10.87] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.68, 11.88] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.26] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.05, 13.73] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.02, 13.97] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [13.05, 14.04] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.00, 14.36] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 12.79] s

  * igt@gem_exec_schedule@fair-sync-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.53, 16.17] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.53, 13.43] s

  * igt@gem_exec_schedule@fair-sync-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.79, 13.40] s

  * igt@gem_exec_schedule@fair-sync-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.53, 13.41] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.01] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.80, 13.66] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.80, 13.79] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [12.93, 13.78] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.74, 13.78] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.02] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.69, 13.47] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.51, 12.92] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [12.84, 13.59] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.54, 12.93] s

  * igt@gem_exec_schedule@fair-throttle:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-rrul@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.41] s

  * igt@gem_exec_schedule@fair-throttle-rrul@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.73, 12.29] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.84, 12.51] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [11.19, 11.56] s

  * igt@gem_exec_schedule@fair-throttle-rrul@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [8.77, 11.18] s

  * igt@gem_exec_schedule@fair-throttle-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-share@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 11.46] s

  * igt@gem_exec_schedule@fair-throttle-share@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.80, 12.15] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [8.85, 11.96] s

  * igt@gem_exec_schedule@fair-throttle-share@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [11.31, 11.39] s

  * igt@gem_exec_schedule@fair-throttle-share@vecs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [8.91, 11.97] s

  * igt@gem_exec_schedule@fair-throttle-solo:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-solo@bcs0:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.0, 12.95] s

  * igt@gem_exec_schedule@fair-throttle-solo@rcs0:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [11.52, 12.60] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [11.58, 12.79] s

  * igt@gem_exec_schedule@fair-throttle-solo@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [11.48, 12.88] s

  * igt@gem_exec_schedule@fair-throttle-solo@vecs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [11.64, 12.85] s

  * igt@gem_exec_schedule@fair-throttle-vip:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-throttle-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 9.96] s

  * igt@gem_exec_schedule@fair-throttle-vip@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [9.08, 11.68] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.14, 12.38] s

  * igt@gem_exec_schedule@fair-throttle-vip@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [9.32, 11.61] s

  * igt@gem_exec_schedule@fair-throttle-vip@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [9.14, 12.43] s

  * igt@gem_exec_schedule@fair-throttle@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 9.05] s

  * igt@gem_exec_schedule@fair-throttle@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [8.84, 12.35] s

  * igt@gem_exec_schedule@fair-throttle@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.86, 12.70] s

  * igt@gem_exec_schedule@fair-throttle@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [11.29, 11.67] s

  * igt@gem_exec_schedule@fair-throttle@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.0, 12.54] s

  * igt@gem_exec_schedule@fairslice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairslice-all:
    - Statuses : 5 pass(s) 1 skip(s)
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
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@preempt-user:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@preempt-user@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.10] s

  * igt@gem_exec_schedule@preempt-user@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_exec_schedule@preempt-user@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@preempt-user@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@gem_exec_schedule@preempt-user@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@u-fairslice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-fairslice-all:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.09] s

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [2.01, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@u-independent:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@u-independent@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.21] s

  * igt@gem_exec_schedule@u-independent@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 1.61] s

  * igt@gem_exec_schedule@u-independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.13] s

  * igt@gem_exec_schedule@u-independent@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.06, 0.11] s

  * igt@gem_exec_schedule@u-independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.16] s

  * igt@gem_exec_schedule@u-lateslice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-lateslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-lateslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_schedule@u-lateslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-lateslice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@gem_exec_schedule@u-lateslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_schedule@u-semaphore-codependency:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_exec_schedule@u-semaphore-noskip:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.44] s

  * igt@gem_exec_schedule@u-semaphore-resolve:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_exec_schedule@u-semaphore-user:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_schedule@u-submit-early-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-submit-early-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@u-submit-early-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.08] s

  * igt@gem_exec_schedule@u-submit-early-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_exec_schedule@u-submit-early-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@u-submit-early-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@u-submit-golden-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-submit-golden-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.08] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@u-submit-late-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-submit-late-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@u-submit-late-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@u-submit-late-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@u-submit-late-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-submit-late-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_userptr_blits@exec-isolation:
    - Statuses : 6 pass(s)
    - Exec time: [2.15, 2.16] s

  * igt@gem_userptr_blits@unmap-isolation:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_5067_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@bcs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2389])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-glk3/igt@gem_exec_reloc@basic-many-active@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-glk9/igt@gem_exec_reloc@basic-many-active@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#155])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-iclb6/igt@i915_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb1/igt@i915_module_load@reload.html

  * igt@i915_selftest@perf@request:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1823])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-tglb8/igt@i915_selftest@perf@request.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb7/igt@i915_selftest@perf@request.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([i915#155] / [i915#794])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1635] / [i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#128])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-iclb7/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb6/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +3 similar issu

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html

--===============1462870016508230300==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/10] i915/gem_userptr_blits: Tighten has_userptr()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82670/">https://patchwork.freedesktop.org/series/82670/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5815_full -&gt; IGTPW_5067_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5067_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5067_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5067_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@fair-next-ping@vecs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb4/igt@gem_exec_schedule@fair-next-ping@vecs0.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb7/igt@gem_exec_schedule@fair-none-ping@rcs0.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-none-solo@rcs0} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl6/igt@gem_exec_schedule@fair-none-solo@rcs0.html">FAIL</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-pace-share@vcs0} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-glk3/igt@gem_exec_schedule@fair-pace-share@vcs0.html">FAIL</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle-solo@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb1/igt@gem_exec_schedule@fair-throttle-solo@vcs1.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@fair-throttle@rcs0} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb2/igt@gem_exec_schedule@fair-throttle@rcs0.html">FAIL</a> +29 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">DMESG-FAIL</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5815_full and IGTPW_5067_full:</p>
<h3>New IGT tests (222)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@u-bonded-cork:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@u-bonded-early:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@u-bonded-imm:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@u-bonded-semaphore:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-user:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-user@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-user@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-user@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-user@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-user@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
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
<li>Exec time: [2.12, 4.33] s</li>
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
<li>Exec time: [2.13, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.15, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.89, 13.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.98, 13.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [12.99, 13.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.99, 13.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.90, 13.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.02, 13.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.01, 13.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-flow@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.58, 15.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.06, 15.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.05, 13.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-half@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.11, 15.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
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
<li>Exec time: [2.13, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.16, 4.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [2.15, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.13, 4.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.90, 13.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [12.98, 13.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next-share@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.93, 13.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 13.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.02, 13.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-next@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.01, 13.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
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
<li>Exec time: [0.0, 7.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.38, 7.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.55, 7.63] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [2.60, 7.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.52, 7.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [9.27, 11.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.01, 12.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.61, 12.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-rrul@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.11, 12.83] s</li>
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
<li>Exec time: [0.0, 12.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [9.68, 12.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.46, 12.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.75, 12.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-share@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.43, 12.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
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
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [13.28, 14.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [15.05, 18.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [13.63, 14.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-solo@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [14.25, 16.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [10.13, 14.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [11.10, 13.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.60, 13.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.95, 13.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.77, 13.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.54, 12.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.80, 12.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-none@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [7.58, 12.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.13, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.12, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [4.20, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-ping@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [2.12, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [8.44, 10.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [8.41, 10.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-share@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [8.40, 8.80] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [8.50, 10.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [8.38, 10.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [8.36, 8.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace-solo@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.59, 10.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.54, 10.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.41, 11.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [10.60, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-pace@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.68, 11.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.05, 13.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.02, 13.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.05, 14.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-spare@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.00, 14.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 12.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.53, 16.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.53, 13.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.79, 13.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-solo@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [10.53, 13.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
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
<li>Exec time: [8.80, 13.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.80, 13.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [12.93, 13.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync-vip@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.74, 13.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.69, 13.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.51, 12.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.84, 13.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-sync@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.54, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.73, 12.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.84, 12.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [11.19, 11.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-rrul@vecs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [8.77, 11.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 11.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.80, 12.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [8.85, 11.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [11.31, 11.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-share@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [8.91, 11.97] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 12.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [11.52, 12.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [11.58, 12.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [11.48, 12.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-solo@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s)</li>
<li>Exec time: [11.64, 12.85] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 9.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [9.08, 11.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.14, 12.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.32, 11.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle-vip@vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [9.14, 12.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 9.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [8.84, 12.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [8.86, 12.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.29, 11.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fair-throttle@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [9.0, 12.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice-all:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
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
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice-all:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.09] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.01, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.04, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.06, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-codependency:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-noskip:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-resolve:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-user:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@exec-isolation:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.15, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unmap-isolation:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5067_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-glk3/igt@gem_exec_reloc@basic-many-active@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-glk9/igt@gem_exec_reloc@basic-many-active@bcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-iclb6/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb1/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-tglb8/igt@i915_selftest@perf@request.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-tglb7/igt@i915_selftest@perf@request.html">INCOMPLETE</a> ([i915#1823])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> ([i915#155] / [i915#794])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">FAIL</a> ([i915#1635] / [i915#54])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-b-torture-move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/shard-iclb7/igt@kms_cursor_legacy@pipe-b-torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/shard-iclb6/igt@kms_cursor_legacy@pipe-b-torture-move.html">DMESG-WARN</a> ([i915#128])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         [PASS][27] -&gt; [DMESG-WARN][28] ([i915#1982]) +3 similar issu</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1462870016508230300==--

--===============1611609310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1611609310==--
