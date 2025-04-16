Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A5EC369AB
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 00:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB5610E18D;
	Wed, 16 Apr 2025 00:44:44 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF2110E18D;
 Wed, 16 Apr 2025 00:44:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4340652653958916059=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_rename_drm=5Ffdinfo_into_?=
 =?utf-8?q?i915=5Ffdinfo_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Apr 2025 00:44:42 -0000
Message-ID: <174476428290.8471.243075617871389404@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============4340652653958916059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: rename drm_fdinfo into i915_fdinfo (rev8)
URL   : https://patchwork.freedesktop.org/series/140053/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8320 -> IGTPW_12984
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12984 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12984, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12984:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_drm_fdinfo@all-busy-idle-check-all (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][1] +63 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-hang@vcs1 (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][2] +63 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-9/igt@i915_drm_fdinfo@busy-hang@vcs1.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@rcs0 (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][3] +71 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-14/igt@i915_drm_fdinfo@busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs0 (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][4] +55 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg1-6/igt@i915_drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@i915_drm_fdinfo@busy-idle@vcs0 (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][5] +55 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-11/igt@i915_drm_fdinfo@busy-idle@vcs0.html

  * {igt@i915_drm_fdinfo@busy-idle@vecs1} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][6] +71 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-8/igt@i915_drm_fdinfo@busy-idle@vecs1.html

  * igt@i915_drm_fdinfo@busy@bcs0 (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][7] +55 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg1-7/igt@i915_drm_fdinfo@busy@bcs0.html

  * {igt@i915_drm_fdinfo@busy@ccs0} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][8] +63 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arls-5/igt@i915_drm_fdinfo@busy@ccs0.html

  * igt@i915_drm_fdinfo@busy@vecs0 (NEW):
    - bat-twl-1:          NOTRUN -> [SKIP][9] +47 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-twl-1/igt@i915_drm_fdinfo@busy@vecs0.html

  * igt@i915_drm_fdinfo@isolation (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][10] +55 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-6/igt@i915_drm_fdinfo@isolation.html

  * igt@i915_drm_fdinfo@isolation@vcs1 (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][11] +55 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-9/igt@i915_drm_fdinfo@isolation@vcs1.html

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0 (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][12] +63 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-6/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0 (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][13] +55 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-rplp-1/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0 (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][14] +47 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-twl-2/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html
    - bat-dg2-11:         NOTRUN -> [SKIP][15] +71 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-11/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0 (NEW):
    - bat-arlh-3:         NOTRUN -> [SKIP][16] +63 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arlh-3/igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0 (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][17] +71 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-atsm-1/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html

  * {igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][18] +71 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-9/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy-hang (NEW):
    - bat-arls-6:         NOTRUN -> [SKIP][19] +63 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arls-6/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_selftest@live@execlists:
    - bat-mtlp-8:         [PASS][20] -> [INCOMPLETE][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-mtlp-8/igt@i915_selftest@live@execlists.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][22] ([i915#12061]) -> [INCOMPLETE][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-mtlp-8/igt@i915_selftest@live.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_selftest@live.html

  
New tests
---------

  New tests have been introduced between IGT_8320 and IGTPW_12984:

### New IGT tests (98) ###

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_drm_fdinfo@basics:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@i915_drm_fdinfo@busy-check-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 2.68] s

  * igt@i915_drm_fdinfo@busy-check-all@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@i915_drm_fdinfo@busy-check-all@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-check-all@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.00, 0.55] s

  * igt@i915_drm_fdinfo@busy-check-all@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_drm_fdinfo@busy-check-all@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@i915_drm_fdinfo@busy-check-all@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_drm_fdinfo@busy-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-hang:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 5.32] s

  * igt@i915_drm_fdinfo@busy-hang@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 1.08] s

  * igt@i915_drm_fdinfo@busy-hang@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-hang@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.00, 1.08] s

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@i915_drm_fdinfo@busy-hang@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@i915_drm_fdinfo@busy-hang@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 1.08] s

  * igt@i915_drm_fdinfo@busy-hang@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-idle:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 3.16] s

  * igt@i915_drm_fdinfo@busy-idle-check-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 3.30] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.00, 0.65] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.75] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_drm_fdinfo@busy-idle-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@i915_drm_fdinfo@busy-idle@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_drm_fdinfo@busy-idle@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_drm_fdinfo@busy-idle@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_drm_fdinfo@busy-idle@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_drm_fdinfo@busy-idle@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_drm_fdinfo@busy@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@busy@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.00, 1.54] s

  * igt@i915_drm_fdinfo@busy@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@i915_drm_fdinfo@busy@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_drm_fdinfo@busy@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@i915_drm_fdinfo@busy@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@context-close-stress:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 10.81] s

  * igt@i915_drm_fdinfo@idle:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 4.70] s

  * igt@i915_drm_fdinfo@idle@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.50, 0.54] s

  * igt@i915_drm_fdinfo@idle@ccs0:
    - Statuses : 12 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@i915_drm_fdinfo@idle@rcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.50, 1.66] s

  * igt@i915_drm_fdinfo@idle@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.50, 0.53] s

  * igt@i915_drm_fdinfo@idle@vcs1:
    - Statuses : 22 pass(s)
    - Exec time: [0.50, 0.52] s

  * igt@i915_drm_fdinfo@idle@vecs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.50, 0.52] s

  * igt@i915_drm_fdinfo@idle@vecs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 0.52] s

  * igt@i915_drm_fdinfo@isolation:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 2.72] s

  * igt@i915_drm_fdinfo@isolation@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@i915_drm_fdinfo@isolation@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_drm_fdinfo@isolation@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@i915_drm_fdinfo@isolation@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@i915_drm_fdinfo@isolation@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@i915_drm_fdinfo@isolation@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@memory-info-active:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.98] s

  * igt@i915_drm_fdinfo@memory-info-active@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [3.09, 4.21] s

  * igt@i915_drm_fdinfo@memory-info-active@smem0:
    - Statuses : 37 pass(s)
    - Exec time: [1.73, 8.24] s

  * igt@i915_drm_fdinfo@memory-info-idle:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@i915_drm_fdinfo@memory-info-idle@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.16] s

  * igt@i915_drm_fdinfo@memory-info-idle@smem0:
    - Statuses : 37 pass(s)
    - Exec time: [0.03, 0.16] s

  * igt@i915_drm_fdinfo@memory-info-purgeable:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.59] s

  * igt@i915_drm_fdinfo@memory-info-purgeable@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [2.93, 5.25] s

  * igt@i915_drm_fdinfo@memory-info-purgeable@smem0:
    - Statuses : 37 pass(s)
    - Exec time: [1.58, 8.25] s

  * igt@i915_drm_fdinfo@memory-info-resident:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.23] s

  * igt@i915_drm_fdinfo@memory-info-resident@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [3.07, 5.14] s

  * igt@i915_drm_fdinfo@memory-info-resident@smem0:
    - Statuses : 37 pass(s)
    - Exec time: [1.64, 8.14] s

  * igt@i915_drm_fdinfo@memory-info-shared:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@i915_drm_fdinfo@memory-info-shared@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@i915_drm_fdinfo@memory-info-shared@smem0:
    - Statuses : 37 pass(s)
    - Exec time: [0.03, 0.13] s

  * igt@i915_drm_fdinfo@most-busy-check-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_drm_fdinfo@most-busy-check-all@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@most-busy-check-all@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.00, 0.59] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 3.26] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@bcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@ccs0:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.00, 0.70] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs1:
    - Statuses : 4 pass(s) 18 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
    - Statuses : 15 pass(s) 22 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_drm_fdinfo@virtual-busy:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 2.77] s

  * igt@i915_drm_fdinfo@virtual-busy-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 5.62] s

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 1.09] s

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 3.32] s

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - Statuses : 15 pass(s) 28 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@i915_drm_fdinfo@virtual-idle:
    - Statuses : 37 pass(s) 6 skip(s)
    - Exec time: [0.0, 3.66] s

  

Known issues
------------

  Here are the changes found in IGTPW_12984 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_drm_fdinfo@busy-check-all@bcs0 (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][24] ([i915#11346]) +63 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arlh-2/igt@i915_drm_fdinfo@busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@busy-hang (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][25] +24 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-pnv-d510/igt@i915_drm_fdinfo@busy-hang.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0 (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][26] +47 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-kbl-guc/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@isolation (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][27] +24 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-blb-e6850/igt@i915_drm_fdinfo@isolation.html

  * {igt@i915_drm_fdinfo@memory-info-resident} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][28] +24 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-ivb-3770/igt@i915_drm_fdinfo@memory-info-resident.html

  * {igt@i915_drm_fdinfo@memory-info-shared} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][29] +24 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-hsw-4770/igt@i915_drm_fdinfo@memory-info-shared.html

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0 (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][30] +47 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-cfl-guc/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-all (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][31] +24 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-ilk-650/igt@i915_drm_fdinfo@virtual-busy-all.html

  * igt@i915_drm_fdinfo@virtual-idle (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][32] +24 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-elk-e7500/igt@i915_drm_fdinfo@virtual-idle.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [INCOMPLETE][33] ([i915#12904]) -> [PASS][34] +1 other test pass
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-adlp-11:        [ABORT][35] ([i915#13696]) -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-adlp-11/igt@i915_selftest@live.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][37] ([i915#13735]) -> [PASS][38] +81 other tests pass
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][39] ([i915#12061]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [DMESG-FAIL][41] ([i915#12061]) -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][43] ([i915#12061]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-8:         [DMESG-FAIL][45] ([i915#12061]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][47] ([i915#13735] / [i915#180]) -> [PASS][48] +53 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8320 -> IGTPW_12984
  * Linux: CI_DRM_16421 -> CI_DRM_16423

  CI-20190529: 20190529
  CI_DRM_16421: f031245c01c722de43e8a02c2358140de0685428 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16423: b8f79cb562e983515cf827f0f336f79423b8d5a7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12984: 404b44c48552eacc7a3b1c0a2e165b61fb4e39d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/index.html

--===============4340652653958916059==
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
<tr><td><b>Series:</b></td><td>rename drm_fdinfo into i915_fdinfo (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140053/">https://patchwork.freedesktop.org/series/140053/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8320 -&gt; IGTPW_12984</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12984 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12984, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12984:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs1 (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-9/igt@i915_drm_fdinfo@busy-hang@vcs1.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@rcs0 (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-14/igt@i915_drm_fdinfo@busy-idle-check-all@rcs0.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs0 (NEW):</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg1-6/igt@i915_drm_fdinfo@busy-idle-check-all@vcs0.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vcs0 (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-11/igt@i915_drm_fdinfo@busy-idle@vcs0.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_drm_fdinfo@busy-idle@vecs1} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-8/igt@i915_drm_fdinfo@busy-idle@vecs1.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@bcs0 (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg1-7/igt@i915_drm_fdinfo@busy@bcs0.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_drm_fdinfo@busy@ccs0} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arls-5/igt@i915_drm_fdinfo@busy@ccs0.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs0 (NEW):</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-twl-1/igt@i915_drm_fdinfo@busy@vecs0.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-6/igt@i915_drm_fdinfo@isolation.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vcs1 (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-9/igt@i915_drm_fdinfo@isolation@vcs1.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0 (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-6/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0 (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-rplp-1/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0 (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-twl-2/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html">SKIP</a> +47 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-11/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0 (NEW):</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arlh-3/igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0 (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-atsm-1/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-9/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang (NEW):</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arls-6/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-mtlp-8/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_selftest@live.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8320 and IGTPW_12984:</p>
<h3>New IGT tests (98)</h3>
<ul>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@basics:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.00, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.00, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.00, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.00, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@context-close-stress:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 10.81] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 4.70] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.50, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@ccs0:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@rcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.50, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.50, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vcs1:</p>
<ul>
<li>Statuses : 22 pass(s)</li>
<li>Exec time: [0.50, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vecs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.50, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@idle@vecs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.50, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 2.72] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.98] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.09, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active@smem0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [1.73, 8.24] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-idle:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-idle@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-idle@smem0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.03, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-purgeable:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.59] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-purgeable@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.93, 5.25] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-purgeable@smem0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [1.58, 8.25] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-resident:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.23] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-resident@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.07, 5.14] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-resident@smem0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [1.64, 8.14] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-shared:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-shared@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-shared@smem0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.03, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.00, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@ccs0:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.00, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 15 pass(s) 22 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 5.62] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>Statuses : 15 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-idle:</p>
<ul>
<li>Statuses : 37 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 3.66] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12984 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@bcs0 (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arlh-2/igt@i915_drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-pnv-d510/igt@i915_drm_fdinfo@busy-hang.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0 (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-kbl-guc/igt@i915_drm_fdinfo@busy-hang@vcs0.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-blb-e6850/igt@i915_drm_fdinfo@isolation.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_drm_fdinfo@memory-info-resident} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-ivb-3770/igt@i915_drm_fdinfo@memory-info-resident.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_drm_fdinfo@memory-info-shared} (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-hsw-4770/igt@i915_drm_fdinfo@memory-info-shared.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0 (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-cfl-guc/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-all (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-ilk-650/igt@i915_drm_fdinfo@virtual-busy-all.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-idle (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-elk-e7500/igt@i915_drm_fdinfo@virtual-idle.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-adlp-11/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-adlp-11/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8320/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12984/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8320 -&gt; IGTPW_12984</li>
<li>Linux: CI_DRM_16421 -&gt; CI_DRM_16423</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16421: f031245c01c722de43e8a02c2358140de0685428 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16423: b8f79cb562e983515cf827f0f336f79423b8d5a7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12984: 404b44c48552eacc7a3b1c0a2e165b61fb4e39d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4340652653958916059==--
