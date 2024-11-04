Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC2CD1BDCC
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 17:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C010E008;
	Mon,  4 Nov 2024 17:03:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23B010E490;
 Mon,  4 Nov 2024 17:02:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1436076163600557989=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_rename_drm=5Ffdinfo_into_i9?=
 =?utf-8?q?15=5Ffdinfo_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 17:02:59 -0000
Message-ID: <173073977971.1400593.2609767673160445701@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031173306.73864-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241031173306.73864-1-kamil.konieczny@linux.intel.com>
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

--===============1436076163600557989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: rename drm_fdinfo into i915_fdinfo (rev5)
URL   : https://patchwork.freedesktop.org/series/140053/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8094 -> IGTPW_12018
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12018 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12018, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/index.html

Participating hosts (45 -> 43)
------------------------------

  Missing    (2): bat-arls-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12018:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_fdinfo@all-busy-check-all} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][1] +71 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-8/igt@i915_fdinfo@all-busy-check-all.html

  * {igt@i915_fdinfo@busy-check-all@rcs0} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][2] +71 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-9/igt@i915_fdinfo@busy-check-all@rcs0.html

  * {igt@i915_fdinfo@busy-check-all@vcs1} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][3] +55 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-rplp-1/igt@i915_fdinfo@busy-check-all@vcs1.html

  * {igt@i915_fdinfo@busy-hang@bcs0} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][4] +71 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-14/igt@i915_fdinfo@busy-hang@bcs0.html

  * {igt@i915_fdinfo@busy-idle-check-all} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][5] +63 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@i915_fdinfo@busy-idle-check-all.html

  * {igt@i915_fdinfo@busy-idle-check-all@bcs0} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][6] +49 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@i915_fdinfo@busy-idle-check-all@bcs0.html

  * {igt@i915_fdinfo@busy-idle-check-all@vcs1} (NEW):
    - bat-arlh-3:         NOTRUN -> [SKIP][7] +63 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@i915_fdinfo@busy-idle-check-all@vcs1.html

  * {igt@i915_fdinfo@busy-idle-check-all@vecs0} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][8] +55 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-9/igt@i915_fdinfo@busy-idle-check-all@vecs0.html

  * {igt@i915_fdinfo@busy-idle@vecs0} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][9] +55 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg1-7/igt@i915_fdinfo@busy-idle@vecs0.html

  * {igt@i915_fdinfo@busy@vecs0} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][10] +63 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-8/igt@i915_fdinfo@busy@vecs0.html

  * {igt@i915_fdinfo@busy@vecs1} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][11] +71 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-atsm-1/igt@i915_fdinfo@busy@vecs1.html

  * {igt@i915_fdinfo@isolation@bcs0} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][12] +71 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@i915_fdinfo@isolation@bcs0.html

  * {igt@i915_fdinfo@isolation@ccs0} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] +63 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-6/igt@i915_fdinfo@isolation@ccs0.html

  * {igt@i915_fdinfo@memory-info-active@smem0} (NEW):
    - fi-bsw-nick:        NOTRUN -> [FAIL][14] +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-bsw-nick/igt@i915_fdinfo@memory-info-active@smem0.html

  * {igt@i915_fdinfo@most-busy-check-all@rcs0} (NEW):
    - bat-twl-1:          NOTRUN -> [SKIP][15] +49 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@i915_fdinfo@most-busy-check-all@rcs0.html

  * {igt@i915_fdinfo@most-busy-idle-check-all} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][16] +55 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-6/igt@i915_fdinfo@most-busy-idle-check-all.html

  * {igt@i915_fdinfo@virtual-busy-hang} (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][17] +55 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-11/igt@i915_fdinfo@virtual-busy-hang.html

  
New tests
---------

  New tests have been introduced between IGT_8094 and IGTPW_12018:

### New IGT tests (98) ###

  * igt@i915_fdinfo@all-busy-check-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@i915_fdinfo@all-busy-idle-check-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@basics:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_fdinfo@busy:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 2.62] s

  * igt@i915_fdinfo@busy-check-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 2.63] s

  * igt@i915_fdinfo@busy-check-all@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@i915_fdinfo@busy-check-all@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@i915_fdinfo@busy-check-all@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.00, 0.56] s

  * igt@i915_fdinfo@busy-check-all@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@i915_fdinfo@busy-check-all@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@i915_fdinfo@busy-check-all@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_fdinfo@busy-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_fdinfo@busy-hang:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 5.20] s

  * igt@i915_fdinfo@busy-hang@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.00, 1.09] s

  * igt@i915_fdinfo@busy-hang@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy-hang@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.02, 1.08] s

  * igt@i915_fdinfo@busy-hang@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@i915_fdinfo@busy-hang@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@i915_fdinfo@busy-hang@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 1.09] s

  * igt@i915_fdinfo@busy-hang@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy-idle:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 3.17] s

  * igt@i915_fdinfo@busy-idle-check-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 3.18] s

  * igt@i915_fdinfo@busy-idle-check-all@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_fdinfo@busy-idle-check-all@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy-idle-check-all@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.00, 0.64] s

  * igt@i915_fdinfo@busy-idle-check-all@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_fdinfo@busy-idle-check-all@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@busy-idle-check-all@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@busy-idle-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy-idle@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_fdinfo@busy-idle@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy-idle@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@busy-idle@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@busy-idle@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@busy-idle@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@busy-idle@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@i915_fdinfo@busy@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@busy@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.02, 0.56] s

  * igt@i915_fdinfo@busy@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_fdinfo@busy@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@i915_fdinfo@busy@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_fdinfo@busy@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@context-close-stress:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 10.77] s

  * igt@i915_fdinfo@idle:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 5.10] s

  * igt@i915_fdinfo@idle@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.50, 0.54] s

  * igt@i915_fdinfo@idle@ccs0:
    - Statuses : 10 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@i915_fdinfo@idle@rcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.50, 2.08] s

  * igt@i915_fdinfo@idle@vcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.50, 0.52] s

  * igt@i915_fdinfo@idle@vcs1:
    - Statuses : 20 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@i915_fdinfo@idle@vecs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@i915_fdinfo@idle@vecs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 0.51] s

  * igt@i915_fdinfo@isolation:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 2.62] s

  * igt@i915_fdinfo@isolation@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@i915_fdinfo@isolation@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@isolation@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@i915_fdinfo@isolation@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@i915_fdinfo@isolation@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@i915_fdinfo@isolation@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_fdinfo@isolation@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@memory-info-active:
    - Statuses : 1 fail(s) 35 pass(s) 6 skip(s)
    - Exec time: [0.0, 8.13] s

  * igt@i915_fdinfo@memory-info-active@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [3.00, 3.69] s

  * igt@i915_fdinfo@memory-info-active@smem0:
    - Statuses : 1 fail(s) 35 pass(s)
    - Exec time: [1.02, 4.47] s

  * igt@i915_fdinfo@memory-info-idle:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@i915_fdinfo@memory-info-idle@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.11] s

  * igt@i915_fdinfo@memory-info-idle@smem0:
    - Statuses : 36 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@i915_fdinfo@memory-info-purgeable:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 8.21] s

  * igt@i915_fdinfo@memory-info-purgeable@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [3.06, 3.89] s

  * igt@i915_fdinfo@memory-info-purgeable@smem0:
    - Statuses : 36 pass(s)
    - Exec time: [1.23, 4.32] s

  * igt@i915_fdinfo@memory-info-resident:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 8.29] s

  * igt@i915_fdinfo@memory-info-resident@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [2.67, 4.15] s

  * igt@i915_fdinfo@memory-info-resident@smem0:
    - Statuses : 36 pass(s)
    - Exec time: [1.09, 4.57] s

  * igt@i915_fdinfo@memory-info-shared:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@i915_fdinfo@memory-info-shared@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.10] s

  * igt@i915_fdinfo@memory-info-shared@smem0:
    - Statuses : 36 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@i915_fdinfo@most-busy-check-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 2.70] s

  * igt@i915_fdinfo@most-busy-check-all@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_fdinfo@most-busy-check-all@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@i915_fdinfo@most-busy-check-all@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.00, 0.56] s

  * igt@i915_fdinfo@most-busy-check-all@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_fdinfo@most-busy-check-all@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_fdinfo@most-busy-check-all@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_fdinfo@most-busy-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@most-busy-idle-check-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 3.19] s

  * igt@i915_fdinfo@most-busy-idle-check-all@bcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_fdinfo@most-busy-idle-check-all@ccs0:
    - Statuses : 10 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_fdinfo@most-busy-idle-check-all@rcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.00, 0.68] s

  * igt@i915_fdinfo@most-busy-idle-check-all@vcs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@i915_fdinfo@most-busy-idle-check-all@vcs1:
    - Statuses : 3 pass(s) 17 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@i915_fdinfo@most-busy-idle-check-all@vecs0:
    - Statuses : 17 pass(s) 19 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_fdinfo@most-busy-idle-check-all@vecs1:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_fdinfo@virtual-busy:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 2.69] s

  * igt@i915_fdinfo@virtual-busy-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@i915_fdinfo@virtual-busy-hang:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 5.27] s

  * igt@i915_fdinfo@virtual-busy-hang-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@i915_fdinfo@virtual-busy-idle:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 3.22] s

  * igt@i915_fdinfo@virtual-busy-idle-all:
    - Statuses : 17 pass(s) 25 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@i915_fdinfo@virtual-idle:
    - Statuses : 36 pass(s) 6 skip(s)
    - Exec time: [0.0, 3.63] s

  

Known issues
------------

  Here are the changes found in IGTPW_12018 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][18] ([i915#10462])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-kbl-8809g/igt@core_getversion@all-cards.html

  * igt@drm_fdinfo@all-busy-check-all:
    - bat-twl-2:          NOTRUN -> [SKIP][19] ([i915#11212]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - bat-dg2-9:          NOTRUN -> [SKIP][20] ([i915#8414]) +71 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-9/igt@drm_fdinfo@all-busy-idle-check-all.html
    - bat-twl-1:          NOTRUN -> [SKIP][21] ([i915#11212]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@all-busy-idle-check-all.html
    - bat-arls-2:         NOTRUN -> [SKIP][22] ([i915#11527] / [i915#8414]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@busy-check-all:
    - bat-twl-1:          NOTRUN -> [SKIP][23] ([i915#11527]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@busy-check-all.html
    - bat-twl-2:          NOTRUN -> [SKIP][24] ([i915#11527]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@busy-check-all.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - bat-arlh-3:         NOTRUN -> [SKIP][25] ([i915#11527]) +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@rcs0:
    - bat-adlp-6:         NOTRUN -> [SKIP][26] ([i915#8414]) +55 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-6/igt@drm_fdinfo@busy-check-all@rcs0.html
    - bat-twl-2:          NOTRUN -> [SKIP][27] ([i915#11208] / [i915#11527]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@busy-check-all@rcs0.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - bat-mtlp-6:         NOTRUN -> [SKIP][28] ([i915#8414]) +63 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-6/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-hang@vcs0:
    - bat-dg2-14:         NOTRUN -> [SKIP][29] ([i915#8414]) +71 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-14/igt@drm_fdinfo@busy-hang@vcs0.html

  * igt@drm_fdinfo@busy-idle:
    - bat-twl-2:          NOTRUN -> [SKIP][30] ([i915#11136]) +19 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@busy-idle.html
    - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#8414]) +71 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@drm_fdinfo@busy-idle.html

  * igt@drm_fdinfo@busy-idle-check-all:
    - fi-ivb-3770:        NOTRUN -> [SKIP][32] +49 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-ivb-3770/igt@drm_fdinfo@busy-idle-check-all.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][33] +49 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-elk-e7500/igt@drm_fdinfo@busy-idle-check-all.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs0:
    - bat-dg2-8:          NOTRUN -> [SKIP][34] ([i915#8414]) +71 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-8/igt@drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - bat-arlh-2:         NOTRUN -> [SKIP][35] ([i915#11346] / [i915#11527]) +15 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy-idle-check-all@vecs0:
    - bat-twl-1:          NOTRUN -> [SKIP][36] ([i915#11208] / [i915#11527]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@busy-idle-check-all@vecs0.html

  * igt@drm_fdinfo@busy-idle@vecs0:
    - bat-rplp-1:         NOTRUN -> [SKIP][37] ([i915#8414]) +55 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-rplp-1/igt@drm_fdinfo@busy-idle@vecs0.html

  * igt@drm_fdinfo@busy@vcs0:
    - bat-adlp-9:         NOTRUN -> [SKIP][38] ([i915#8414]) +55 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-9/igt@drm_fdinfo@busy@vcs0.html

  * igt@drm_fdinfo@busy@vecs0:
    - bat-twl-1:          NOTRUN -> [SKIP][39] ([i915#11136]) +19 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@busy@vecs0.html
    - bat-arlh-2:         NOTRUN -> [SKIP][40] ([i915#11346] / [i915#11475]) +27 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@busy@vecs0.html

  * igt@drm_fdinfo@context-close-stress:
    - fi-blb-e6850:       NOTRUN -> [SKIP][41] +49 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-blb-e6850/igt@drm_fdinfo@context-close-stress.html

  * igt@drm_fdinfo@isolation@bcs0:
    - bat-arls-2:         NOTRUN -> [SKIP][42] ([i915#11475] / [i915#8414]) +27 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@isolation@bcs0.html

  * igt@drm_fdinfo@isolation@vcs0:
    - bat-dg1-7:          NOTRUN -> [SKIP][43] ([i915#8414]) +55 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg1-7/igt@drm_fdinfo@isolation@vcs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - bat-arlh-3:         NOTRUN -> [SKIP][44] ([i915#11475]) +27 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@isolation@vecs1:
    - bat-atsm-1:         NOTRUN -> [SKIP][45] ([i915#8414]) +71 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-atsm-1/igt@drm_fdinfo@isolation@vecs1.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - bat-twl-2:          NOTRUN -> [SKIP][46] ([i915#11168]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - bat-mtlp-8:         NOTRUN -> [SKIP][47] ([i915#8414]) +63 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-8/igt@drm_fdinfo@most-busy-check-all@rcs0.html
    - bat-twl-1:          NOTRUN -> [SKIP][48] ([i915#11168]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - bat-arls-2:         NOTRUN -> [SKIP][49] ([i915#8414]) +27 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@most-busy-check-all@vcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vcs0:
    - bat-dg1-6:          NOTRUN -> [SKIP][50] ([i915#12311]) +111 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg1-6/igt@drm_fdinfo@most-busy-idle-check-all@vcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vcs1:
    - bat-arlh-2:         NOTRUN -> [SKIP][51] ([i915#11346] / [i915#11400]) +13 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@most-busy-idle-check-all@vcs1.html
    - bat-arlh-3:         NOTRUN -> [SKIP][52] ([i915#11400]) +13 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@most-busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@virtual-busy:
    - bat-arlh-3:         NOTRUN -> [SKIP][53] ([i915#11542]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@virtual-busy.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][54] +49 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-pnv-d510/igt@drm_fdinfo@virtual-busy.html
    - bat-twl-1:          NOTRUN -> [SKIP][55] ([i915#8414]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-all:
    - bat-adlp-11:        NOTRUN -> [SKIP][56] ([i915#8414]) +55 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-11/igt@drm_fdinfo@virtual-busy-all.html
    - bat-arls-2:         NOTRUN -> [SKIP][57] ([i915#11542] / [i915#8414]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - bat-adlm-1:         NOTRUN -> [SKIP][58] ([i915#8414] / [i915#9900]) +55 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlm-1/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - bat-twl-2:          NOTRUN -> [SKIP][59] ([i915#8414]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - bat-arlh-2:         NOTRUN -> [SKIP][60] ([i915#11346] / [i915#11542]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@fbdev@eof:
    - fi-kbl-8809g:       [PASS][61] -> [SKIP][62] +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/fi-kbl-8809g/igt@fbdev@eof.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-kbl-8809g/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-kbl-8809g:       [PASS][63] -> [SKIP][64] ([i915#1849])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/fi-kbl-8809g/igt@fbdev@info.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-kbl-8809g/igt@fbdev@info.html

  * {igt@i915_fdinfo@busy-check-all@vcs1} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][65] ([i915#11346]) +63 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@i915_fdinfo@busy-check-all@vcs1.html

  * {igt@i915_fdinfo@busy-idle@vcs1} (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][66] ([i915#9900]) +55 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlm-1/igt@i915_fdinfo@busy-idle@vcs1.html

  * {igt@i915_fdinfo@memory-info-shared} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][67] +49 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-ilk-650/igt@i915_fdinfo@memory-info-shared.html

  * {igt@i915_fdinfo@virtual-busy-idle} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][68] +49 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-hsw-4770/igt@i915_fdinfo@virtual-busy-idle.html

  * igt@i915_selftest@live:
    - bat-dg2-11:         [PASS][69] -> [DMESG-FAIL][70] ([i915#12133])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-dg2-11/igt@i915_selftest@live.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-11:         [PASS][71] -> [DMESG-FAIL][72] ([i915#9500])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-twl-2:          [INCOMPLETE][73] ([i915#12133] / [i915#9413]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-twl-2/igt@i915_selftest@live.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [INCOMPLETE][75] ([i915#12445] / [i915#9413]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - bat-apl-1:          [DMESG-WARN][77] ([i915#180]) -> [DMESG-WARN][78] ([i915#180] / [i915#1982])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@i915_module_load@reload.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-apl-1/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10462
  [i915#11136]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11136
  [i915#11168]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11168
  [i915#11208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11208
  [i915#11212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11212
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11400
  [i915#11475]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11475
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11542
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8094 -> IGTPW_12018

  CI-20190529: 20190529
  CI_DRM_15627: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12018: 6d3061633fa8f9a811fd8931267940206d65bb3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/index.html

--===============1436076163600557989==
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
<tr><td><b>Series:</b></td><td>rename drm_fdinfo into i915_fdinfo (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140053/">https://patchwork.freedesktop.org/series/140053/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8094 -&gt; IGTPW_12018</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12018 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12018, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/index.html</p>
<h2>Participating hosts (45 -&gt; 43)</h2>
<p>Missing    (2): bat-arls-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12018:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_fdinfo@all-busy-check-all} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-8/igt@i915_fdinfo@all-busy-check-all.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-check-all@rcs0} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-9/igt@i915_fdinfo@busy-check-all@rcs0.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-check-all@vcs1} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-rplp-1/igt@i915_fdinfo@busy-check-all@vcs1.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-hang@bcs0} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-14/igt@i915_fdinfo@busy-hang@bcs0.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-idle-check-all} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@i915_fdinfo@busy-idle-check-all.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-idle-check-all@bcs0} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@i915_fdinfo@busy-idle-check-all@bcs0.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-idle-check-all@vcs1} (NEW):</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@i915_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-idle-check-all@vecs0} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-9/igt@i915_fdinfo@busy-idle-check-all@vecs0.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-idle@vecs0} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg1-7/igt@i915_fdinfo@busy-idle@vecs0.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy@vecs0} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-8/igt@i915_fdinfo@busy@vecs0.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy@vecs1} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-atsm-1/igt@i915_fdinfo@busy@vecs1.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@isolation@bcs0} (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@i915_fdinfo@isolation@bcs0.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@isolation@ccs0} (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-6/igt@i915_fdinfo@isolation@ccs0.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@memory-info-active@smem0} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-bsw-nick/igt@i915_fdinfo@memory-info-active@smem0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@most-busy-check-all@rcs0} (NEW):</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@i915_fdinfo@most-busy-check-all@rcs0.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@most-busy-idle-check-all} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-6/igt@i915_fdinfo@most-busy-idle-check-all.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@virtual-busy-hang} (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-11/igt@i915_fdinfo@virtual-busy-hang.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8094 and IGTPW_12018:</p>
<h3>New IGT tests (98)</h3>
<ul>
<li>
<p>igt@i915_fdinfo@all-busy-check-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@basics:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.00, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.00, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.02, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-hang@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 3.18] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.00, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy-idle@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.02, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@busy@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@context-close-stress:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 10.77] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 5.10] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@bcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.50, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@ccs0:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@rcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.50, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@vcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.50, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@vcs1:</p>
<ul>
<li>Statuses : 20 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@vecs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@idle@vecs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.50, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@isolation@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-active:</p>
<ul>
<li>Statuses : 1 fail(s) 35 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 8.13] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-active@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.00, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-active@smem0:</p>
<ul>
<li>Statuses : 1 fail(s) 35 pass(s)</li>
<li>Exec time: [1.02, 4.47] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-idle:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-idle@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.04, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-idle@smem0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-purgeable:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 8.21] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-purgeable@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.06, 3.89] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-purgeable@smem0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [1.23, 4.32] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-resident:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 8.29] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-resident@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.67, 4.15] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-resident@smem0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [1.09, 4.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-shared:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-shared@lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.03, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@memory-info-shared@smem0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.00, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 3.19] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@bcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@ccs0:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.00, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>Statuses : 17 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-busy:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-busy-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-busy-hang:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 5.27] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-busy-idle:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>Statuses : 17 pass(s) 25 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@i915_fdinfo@virtual-idle:</p>
<ul>
<li>Statuses : 36 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 3.63] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12018 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-kbl-8809g/igt@core_getversion@all-cards.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10462">i915#10462</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11212">i915#11212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-9/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +71 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11212">i915#11212</a>) +1 other test skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@rcs0:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-6/igt@drm_fdinfo@busy-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +55 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@busy-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11208">i915#11208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-6/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-14/igt@drm_fdinfo@busy-hang@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11136">i915#11136</a>) +19 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@drm_fdinfo@busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-ivb-3770/igt@drm_fdinfo@busy-idle-check-all.html">SKIP</a> +49 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-elk-e7500/igt@drm_fdinfo@busy-idle-check-all.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-8/igt@drm_fdinfo@busy-idle-check-all@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vecs0:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@busy-idle-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11208">i915#11208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-rplp-1/igt@drm_fdinfo@busy-idle@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs0:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-9/igt@drm_fdinfo@busy@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vecs0:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@busy@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11136">i915#11136</a>) +19 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@busy@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11475">i915#11475</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@context-close-stress:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-blb-e6850/igt@drm_fdinfo@context-close-stress.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@isolation@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11475">i915#11475</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vcs0:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg1-7/igt@drm_fdinfo@isolation@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11475">i915#11475</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs1:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-atsm-1/igt@drm_fdinfo@isolation@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11168">i915#11168</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-mtlp-8/igt@drm_fdinfo@most-busy-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +63 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11168">i915#11168</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@most-busy-check-all@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg1-6/igt@drm_fdinfo@most-busy-idle-check-all@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vcs1:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@most-busy-idle-check-all@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11400">i915#11400</a>) +13 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@most-busy-idle-check-all@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11400">i915#11400</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-3/igt@drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11542">i915#11542</a>) +5 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-pnv-d510/igt@drm_fdinfo@virtual-busy.html">SKIP</a> +49 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-1/igt@drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlp-11/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +55 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arls-2/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11542">i915#11542</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlm-1/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11542">i915#11542</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/fi-kbl-8809g/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-kbl-8809g/igt@fbdev@eof.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/fi-kbl-8809g/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-check-all@vcs1} (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-arlh-2/igt@i915_fdinfo@busy-check-all@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@busy-idle@vcs1} (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-adlm-1/igt@i915_fdinfo@busy-idle@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@memory-info-shared} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-ilk-650/igt@i915_fdinfo@memory-info-shared.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_fdinfo@virtual-busy-idle} (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/fi-hsw-4770/igt@i915_fdinfo@virtual-busy-idle.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-dg2-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12018/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8094 -&gt; IGTPW_12018</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15627: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12018: 6d3061633fa8f9a811fd8931267940206d65bb3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1436076163600557989==--
