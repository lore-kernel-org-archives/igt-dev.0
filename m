Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B53CDE012
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 15:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652FB10E04B;
	Thu, 26 Sep 2024 15:30:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCDD10E04B;
 Thu, 26 Sep 2024 15:30:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1114853344952023141=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Async_flip_with_atomic_comm?=
 =?utf-8?q?it?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 15:30:03 -0000
Message-ID: <172736460301.1107941.13805586225906194977@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926140836.939153-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240926140836.939153-1-santhosh.reddy.guddati@intel.com>
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

--===============1114853344952023141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Async flip with atomic commit
URL   : https://patchwork.freedesktop.org/series/139163/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15448 -> IGTPW_11814
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11814 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11814, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): bat-arls-1 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11814:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][1] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs-cc} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][2] +23 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adls-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][3] +14 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-mc-ccs} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][4] +25 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-mc-ccs.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs} (NEW):
    - bat-twl-1:          NOTRUN -> [SKIP][5] +10 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs.html
    - bat-rplp-1:         NOTRUN -> [SKIP][6] +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs-cc} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][7] +10 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs-cc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf-ccs} (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][8] +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][9] +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs-cc} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][10] +12 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs-cc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][11] +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs.html
    - bat-rpls-4:         NOTRUN -> [SKIP][12] +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rpls-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-mc-ccs} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][13] +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][14] +14 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-mc-ccs} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][16] +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][17] +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - bat-dg2-11:         NOTRUN -> [FAIL][18] +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@invalid-async-flip:
    - fi-rkl-11600:       NOTRUN -> [FAIL][19] +7 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-rkl-11600/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][20] +12 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * {igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-edp-1} (NEW):
    - bat-jsl-1:          NOTRUN -> [FAIL][21] +7 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-jsl-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-edp-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1 (NEW):
    - fi-cfl-guc:         NOTRUN -> [FAIL][22] +7 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-guc/igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1.html

  * {igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-1} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [FAIL][23] +13 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8109u/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-1.html

  * {igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1} (NEW):
    - bat-twl-2:          NOTRUN -> [FAIL][24] +7 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1.html
    - bat-twl-1:          NOTRUN -> [FAIL][25] +7 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2 (NEW):
    - fi-glk-j4005:       NOTRUN -> [FAIL][26] +7 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-glk-j4005/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1 (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][27] +9 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-tgl-1115g4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][28] +7 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8700k/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2:
    - bat-dg1-7:          NOTRUN -> [FAIL][29] +9 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg1-7/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2.html
    - bat-rpls-4:         NOTRUN -> [FAIL][30] +9 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rpls-4/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1:
    - bat-adls-6:         NOTRUN -> [FAIL][31] +17 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adls-6/igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:
    - bat-adlp-6:         NOTRUN -> [FAIL][32] +17 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1:
    - bat-adlp-9:         NOTRUN -> [FAIL][33] +9 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1.html
    - bat-apl-1:          NOTRUN -> [FAIL][34] +7 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-apl-1/igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1:
    - bat-rplp-1:         NOTRUN -> [FAIL][35] +9 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rplp-1/igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1.html

  * igt@kms_async_flips@test-cursor-atomic (NEW):
    - {bat-arlh-3}:       NOTRUN -> [SKIP][36] +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-3/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_async_flips@test-time-stamp:
    - bat-arls-1:         NOTRUN -> [DMESG-WARN][37] +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@test-time-stamp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@test-cursor:
    - {bat-arlh-3}:       NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-3/igt@kms_async_flips@test-cursor.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15448 and IGTPW_11814:

### New IGT tests (356) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - Statuses : 26 pass(s) 11 skip(s)
    - Exec time: [0.0, 21.38] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.14, 2.35] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 2.31] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.73, 2.91] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.09, 2.14] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.10, 2.36] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.09, 2.14] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.13, 2.33] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 2.26] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.36, 2.91] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.06, 2.12] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.07, 2.16] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.07, 2.10] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.13, 2.31] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 2.25] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.35, 2.92] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.07, 2.12] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.08, 2.16] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.09] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 2.15] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.14, 2.25] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.35, 2.90] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.12] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.07, 2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - Statuses : 26 pass(s) 11 skip(s)
    - Exec time: [0.0, 58.51] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-linear:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.07, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-x:
    - Statuses : 4 pass(s)
    - Exec time: [2.07, 2.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y:
    - Statuses : 4 pass(s)
    - Exec time: [2.15, 2.40] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.21, 0.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.22, 0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.18, 0.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.17, 0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-yf:
    - Statuses : 2 pass(s)
    - Exec time: [2.14, 2.39] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-yf-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.34, 0.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 2.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.17, 2.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.83] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-linear:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.13, 2.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-x:
    - Statuses : 8 pass(s)
    - Exec time: [2.04, 2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y:
    - Statuses : 5 pass(s)
    - Exec time: [2.11, 2.35] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.45] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-mc-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.70, 0.85] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-rc-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.12, 0.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-rc-ccs-cc:
    - Statuses : 4 skip(s)
    - Exec time: [0.12, 0.33] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.84] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-linear:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.06, 2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-x:
    - Statuses : 5 pass(s)
    - Exec time: [2.04, 2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y:
    - Statuses : 5 pass(s)
    - Exec time: [2.07, 2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.11, 0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.10, 0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 2.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.30, 0.34] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.23, 0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.23, 0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-linear:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.12, 2.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-x:
    - Statuses : 6 pass(s)
    - Exec time: [2.08, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y:
    - Statuses : 3 pass(s)
    - Exec time: [2.16, 2.32] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.19, 0.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.17, 0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-vga-1-linear:
    - Statuses : 3 skip(s)
    - Exec time: [0.03, 0.09] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-vga-1-x:
    - Statuses : 3 pass(s)
    - Exec time: [2.07, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-linear:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.07, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-x:
    - Statuses : 4 pass(s)
    - Exec time: [2.07, 2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y:
    - Statuses : 4 pass(s)
    - Exec time: [2.14, 2.40] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.21, 0.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.23, 0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.14, 0.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-yf:
    - Statuses : 2 pass(s)
    - Exec time: [2.14, 2.37] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-yf-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 0.60] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.05, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.17, 2.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.83, 0.84] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-linear:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.10, 2.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-x:
    - Statuses : 8 pass(s)
    - Exec time: [2.04, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y:
    - Statuses : 5 pass(s)
    - Exec time: [2.09, 2.33] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.41] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-mc-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.40, 0.86] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.10, 0.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs-cc:
    - Statuses : 4 skip(s)
    - Exec time: [0.10, 0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.84] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-linear:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.06, 2.05] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-x:
    - Statuses : 5 pass(s)
    - Exec time: [2.04, 2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - Statuses : 5 pass(s)
    - Exec time: [2.07, 2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.07, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.28, 0.32] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.23, 0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.21, 0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-linear:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.10, 2.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-x:
    - Statuses : 6 pass(s)
    - Exec time: [2.06, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y:
    - Statuses : 3 pass(s)
    - Exec time: [2.13, 2.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.20, 0.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.37] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-vga-1-linear:
    - Statuses : 3 skip(s)
    - Exec time: [0.03, 0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-vga-1-x:
    - Statuses : 3 pass(s)
    - Exec time: [2.08, 2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-linear:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.08, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-x:
    - Statuses : 4 pass(s)
    - Exec time: [2.07, 2.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y:
    - Statuses : 4 pass(s)
    - Exec time: [2.14, 2.38] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.23, 0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.14, 0.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-yf:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.19, 2.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.84] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.17, 0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.10, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-x:
    - Statuses : 8 pass(s)
    - Exec time: [2.03, 2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y:
    - Statuses : 5 pass(s)
    - Exec time: [2.09, 2.32] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.41] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-mc-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.41, 0.88] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-rc-ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.10, 0.31] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-rc-ccs-cc:
    - Statuses : 4 skip(s)
    - Exec time: [0.10, 0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.85] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.07, 2.05] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-x:
    - Statuses : 5 pass(s)
    - Exec time: [2.03, 2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y:
    - Statuses : 5 pass(s)
    - Exec time: [2.07, 2.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.07, 0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.09, 0.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-yf:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.23, 2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.27, 0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.23, 0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.21, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-linear:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.10, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-x:
    - Statuses : 6 pass(s)
    - Exec time: [2.06, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y:
    - Statuses : 3 pass(s)
    - Exec time: [2.15, 2.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-linear:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.06] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.09] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.05, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.22, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.14, 0.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.18, 2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.83, 0.84] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.19, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.17, 0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-linear:
    - Statuses : 5 pass(s)
    - Exec time: [2.03, 2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-x:
    - Statuses : 5 pass(s)
    - Exec time: [2.05, 2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.41, 0.84] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.10, 0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.02, 2.03] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.03, 2.05] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.08, 0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.09, 0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4:
    - Statuses : 3 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.28, 0.31] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.20, 0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-linear:
    - Statuses : 5 pass(s)
    - Exec time: [2.05, 2.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-x:
    - Statuses : 5 pass(s)
    - Exec time: [2.07, 2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.14, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.18, 0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.15, 0.21] s

  * igt@kms_async_flips@crc-atomic:
    - Statuses : 26 pass(s) 11 skip(s)
    - Exec time: [0.0, 21.86] s

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.21, 2.42] s

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.40] s

  * igt@kms_async_flips@crc-atomic@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.80, 2.95] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.11, 2.21] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.20, 2.54] s

  * igt@kms_async_flips@crc-atomic@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.15, 2.22] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.21, 2.38] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@crc-atomic@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.31] s

  * igt@kms_async_flips@crc-atomic@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.42, 2.99] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 2.34] s

  * igt@kms_async_flips@crc-atomic@pipe-b-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.14, 2.17] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.21, 2.38] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.30] s

  * igt@kms_async_flips@crc-atomic@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.42, 2.98] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 2.34] s

  * igt@kms_async_flips@crc-atomic@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.14, 2.16] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.33] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.31] s

  * igt@kms_async_flips@crc-atomic@pipe-d-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.42, 2.98] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.18] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.16, 2.34] s

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - Statuses : 16 fail(s) 21 skip(s)
    - Exec time: [0.0, 10.22] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.24, 0.59] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.95] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-edp-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.73, 0.91] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.09, 0.16] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.14, 0.83] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 4.65] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.96] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.46, 0.91] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.09, 0.84] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.10, 1.38] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-1:
    - Statuses : 4 fail(s)
    - Exec time: [0.20, 4.65] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.94] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-edp-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.48, 0.94] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - Statuses : 5 fail(s)
    - Exec time: [0.08, 0.48] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 3 fail(s)
    - Exec time: [0.12, 1.92] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.20, 0.58] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.49, 0.92] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.08, 0.14] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-2:
    - Statuses : 2 fail(s)
    - Exec time: [0.11, 1.94] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-cursor-atomic:
    - Statuses : 20 pass(s) 17 skip(s)
    - Exec time: [0.0, 4.98] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.12, 0.33] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.85, 0.89] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.34] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.08, 0.14] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.12, 0.29] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.85, 0.89] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.12, 0.29] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.85, 0.86] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.11] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@kms_async_flips@test-time-stamp-atomic:
    - Statuses : 26 pass(s) 11 skip(s)
    - Exec time: [0.0, 5.81] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.35] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.32] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.72, 0.92] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.09, 0.15] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [0.15, 0.40] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.11, 0.16] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.14, 0.32] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.26] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.47, 0.92] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.19] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.15, 0.35] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.26] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.48, 0.93] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.19] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.27] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.49, 0.92] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.14] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.11, 0.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_11814 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][39] ([i915#9900]) +11 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlm-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic (NEW):
    - bat-kbl-2:          NOTRUN -> [SKIP][40] +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-kbl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-linear} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][41] +27 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8109u/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-linear.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-linear} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][42] +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-hsw-4770/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs:
    - bat-arls-5:         NOTRUN -> [SKIP][43] ([i915#8709]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:
    - bat-twl-2:          NOTRUN -> [SKIP][44] ([i915#8709]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html
    - bat-twl-1:          NOTRUN -> [SKIP][45] ([i915#8709]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:
    - fi-rkl-11600:       NOTRUN -> [SKIP][46] ([i915#8709]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - bat-adls-6:         NOTRUN -> [SKIP][47] ([i915#8709]) +23 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adls-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][48] ([i915#8709]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][49] +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8700k/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs:
    - bat-arls-1:         NOTRUN -> [SKIP][50] ([i915#8709]) +11 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs:
    - bat-dg2-11:         NOTRUN -> [SKIP][51] ([i915#8709]) +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear:
    - fi-glk-j4005:       NOTRUN -> [SKIP][52] +13 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-glk-j4005/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear:
    - bat-apl-1:          NOTRUN -> [SKIP][53] +13 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-apl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs:
    - bat-arls-2:         NOTRUN -> [SKIP][54] ([i915#8709]) +11 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:
    - bat-mtlp-8:         NOTRUN -> [SKIP][55] ([i915#8709]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs:
    - bat-dg2-14:         NOTRUN -> [SKIP][56] ([i915#8709]) +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear:
    - fi-ivb-3770:        NOTRUN -> [SKIP][57] +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-ivb-3770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html
    - fi-ilk-650:         NOTRUN -> [SKIP][58] +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-ilk-650/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs:
    - bat-adlp-9:         NOTRUN -> [SKIP][59] ([i915#8709]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs:
    - bat-jsl-1:          NOTRUN -> [SKIP][60] ([i915#8709]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:
    - fi-cfl-guc:         NOTRUN -> [SKIP][61] +13 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs:
    - bat-dg1-7:          NOTRUN -> [SKIP][62] ([i915#8709]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs-cc:
    - bat-rpls-4:         NOTRUN -> [SKIP][63] ([i915#8709]) +11 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rpls-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-3-y-mc-ccs:
    - bat-adlp-6:         NOTRUN -> [SKIP][64] ([i915#8709]) +23 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-3-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc:
    - bat-rplp-1:         NOTRUN -> [SKIP][65] ([i915#8709]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - bat-arlh-2:         NOTRUN -> [SKIP][66] ([i915#11346]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][67] ([i915#9197]) +11 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-9/igt@kms_async_flips@crc-atomic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][68] +11 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-kbl-x1275/igt@kms_async_flips@crc-atomic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][69] ([i915#10470]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-11/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@invalid-async-flip:
    - bat-dg2-14:         NOTRUN -> [SKIP][70] ([i915#6228])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-14/igt@kms_async_flips@invalid-async-flip.html
    - bat-arls-5:         NOTRUN -> [SKIP][71] ([i915#6228])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-5/igt@kms_async_flips@invalid-async-flip.html
    - bat-dg2-11:         NOTRUN -> [SKIP][72] ([i915#6228])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@invalid-async-flip.html
    - bat-arls-2:         NOTRUN -> [SKIP][73] ([i915#6228])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-2/igt@kms_async_flips@invalid-async-flip.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][74] ([i915#6228])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-8/igt@kms_async_flips@invalid-async-flip.html
    - bat-arls-1:         NOTRUN -> [SKIP][75] ([i915#6228])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][76] ([i915#9792]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-6/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor:
    - bat-adlp-11:        NOTRUN -> [SKIP][77] ([i915#10470] / [i915#10501]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-11/igt@kms_async_flips@test-cursor.html

  * igt@kms_async_flips@test-time-stamp:
    - fi-kbl-guc:         NOTRUN -> [SKIP][78] +11 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-kbl-guc/igt@kms_async_flips@test-time-stamp.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][79] +11 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-blb-e6850/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_async_flips@test-time-stamp-atomic (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][80] +11 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-kbl-8809g/igt@kms_async_flips@test-time-stamp-atomic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][81] +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-elk-e7500/igt@kms_async_flips@test-time-stamp-atomic.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - bat-dg2-13:         NOTRUN -> [SKIP][82] ([i915#7828]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8032 -> IGTPW_11814

  CI-20190529: 20190529
  CI_DRM_15448: ec87b409d3a9358c9a079186d528fad3f7d64334 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11814: ac33897005f5c66252918ef73c46324f47d7f645 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/index.html

--===============1114853344952023141==
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
<tr><td><b>Series:</b></td><td>Async flip with atomic commit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139163/">https://patchwork.freedesktop.org/series/139163/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15448 -&gt; IGTPW_11814</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11814 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11814, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): bat-arls-1 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11814:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs-cc} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adls-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs-cc.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-mc-ccs} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-mc-ccs.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs} (NEW):</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs.html">SKIP</a> +10 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs-cc} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs-cc.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf-ccs} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf-ccs.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs-cc} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs-cc.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs.html">SKIP</a> +7 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rpls-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-mc-ccs} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-mc-ccs.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-mc-ccs} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc} (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@crc.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-rkl-11600/igt@kms_async_flips@invalid-async-flip.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-edp-1} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-jsl-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-edp-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1 (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-guc/igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-1} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8109u/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-1.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> +7 other tests fail</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2 (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-glk-j4005/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1 (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-tgl-1115g4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8700k/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg1-7/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2.html">FAIL</a> +9 other tests fail</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rpls-4/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-2.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adls-6/igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1.html">FAIL</a> +9 other tests fail</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-apl-1/igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rplp-1/igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic (NEW):</p>
<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-3/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@test-time-stamp.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_async_flips@test-cursor:<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-3/igt@kms_async_flips@test-cursor.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15448 and IGTPW_11814:</p>
<h3>New IGT tests (356)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>Statuses : 26 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 21.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.14, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.73, 2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.09, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.10, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.09, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.13, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.13, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.36, 2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.06, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.07, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.07, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.13, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.13, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.35, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.07, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.08, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.13, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.35, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.07, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>Statuses : 26 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 58.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-linear:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.07, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.07, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.15, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.21, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.22, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.18, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.17, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-1-yf-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-linear:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.08, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-3-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.17, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-linear:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.13, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-x:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.04, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.11, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.70, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.12, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.12, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-linear:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.06, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.04, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.07, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.11, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.10, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.13, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.30, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.23, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.23, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-linear:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.12, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.08, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.16, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.19, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.17, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-vga-1-linear:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.03, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-vga-1-x:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.07, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-linear:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.07, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.07, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.14, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.21, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.23, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.14, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-1-yf-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.05, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.17, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.83, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-linear:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.10, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-x:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.04, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.09, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.40, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.10, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.10, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-linear:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.06, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.04, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.07, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.07, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.12, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.28, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.23, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.21, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-linear:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.10, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.06, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.13, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.20, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-vga-1-linear:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.03, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-vga-1-x:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.08, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-linear:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.08, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.07, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.14, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.23, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.14, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.37, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-linear:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-2-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-3-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.19, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.17, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.10, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-x:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.03, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.09, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.41, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.10, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.10, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-yf-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.07, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.03, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.07, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.07, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.09, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.23, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.27, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.23, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.21, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-linear:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.10, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.06, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.15, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-linear:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.05, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.22, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.14, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-3-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.18, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.83, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.19, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.17, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.03, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.05, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.41, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.10, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.02, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.03, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.08, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.28, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.20, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.05, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.07, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.18, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.15, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>Statuses : 26 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 21.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.21, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.80, 2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.11, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.15, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.21, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.42, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.14, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.21, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.42, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.14, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.42, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.10, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.16, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>Statuses : 16 fail(s) 21 skip(s)</li>
<li>Exec time: [0.0, 10.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.24, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.73, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.09, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.14, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.46, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.09, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.10, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.20, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.48, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.08, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.12, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.20, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.49, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.08, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.11, 1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>Statuses : 20 pass(s) 17 skip(s)</li>
<li>Exec time: [0.0, 4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.12, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.85, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.08, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.12, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.85, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.12, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.85, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic:</p>
<ul>
<li>Statuses : 26 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 5.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.72, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.09, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.15, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.11, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.14, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.47, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.08, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.15, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.48, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.49, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.11, 0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11814 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlm-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic (NEW):</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-kbl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-linear} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8109u/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-1-linear.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-linear} (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-hsw-4770/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-vga-1-linear.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +8 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-twl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adls-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +23 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-8700k/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-glk-j4005/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-apl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-ivb-3770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html">SKIP</a> +7 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-ilk-650/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-cfl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rpls-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-3-y-mc-ccs:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-3-y-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arlh-2/igt@kms_async_flips@crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-9/igt@kms_async_flips@crc-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +11 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-kbl-x1275/igt@kms_async_flips@crc-atomic.html">SKIP</a> +11 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-11/igt@kms_async_flips@crc-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-14/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-arls-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-mtlp-6/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-adlp-11/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-kbl-guc/igt@kms_async_flips@test-time-stamp.html">SKIP</a> +11 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-blb-e6850/igt@kms_async_flips@test-time-stamp.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-kbl-8809g/igt@kms_async_flips@test-time-stamp-atomic.html">SKIP</a> +11 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/fi-elk-e7500/igt@kms_async_flips@test-time-stamp-atomic.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11814/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8032 -&gt; IGTPW_11814</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15448: ec87b409d3a9358c9a079186d528fad3f7d64334 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11814: ac33897005f5c66252918ef73c46324f47d7f645 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032</p>

</body>
</html>

--===============1114853344952023141==--
