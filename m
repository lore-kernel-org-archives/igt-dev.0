Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E38CDE012
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 15:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158D410EB6E;
	Thu, 26 Sep 2024 15:08:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EED10EB6E;
 Thu, 26 Sep 2024 15:08:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3047812625286335468=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Async_flips_suspend_resume_test_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 15:08:06 -0000
Message-ID: <172736328627.1107896.16512068759637856680@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
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

--===============3047812625286335468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Async flips suspend resume test (rev5)
URL   : https://patchwork.freedesktop.org/series/138302/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15448 -> IGTPW_11812
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11812 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11812, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (1): bat-arls-1 
  Missing    (2): bat-rpls-4 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11812:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * {igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1} (NEW):
    - bat-apl-1:          NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-apl-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1 (NEW):
    - {bat-arlh-3}:       NOTRUN -> [FAIL][3] +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_async_flips@test-cursor:
    - bat-arls-2:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-2/igt@kms_async_flips@test-cursor.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-8/igt@kms_async_flips@test-cursor.html
    - bat-twl-2:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-2/igt@kms_async_flips@test-cursor.html
    - bat-twl-1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-1/igt@kms_async_flips@test-cursor.html
    - bat-adlp-6:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-6/igt@kms_async_flips@test-cursor.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@test-cursor:
    - {bat-arlh-3}:       NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-3/igt@kms_async_flips@test-cursor.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15448 and IGTPW_11812:

### New IGT tests (30) ###

  * igt@kms_async_flips@async-flip-suspend-resume:
    - Statuses : 1 dmesg-warn(s) 1 fail(s) 23 pass(s) 11 skip(s)
    - Exec time: [0.0, 72.77] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-1:
    - Statuses : 1 dmesg-warn(s) 3 pass(s)
    - Exec time: [1.83, 3.41] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.50, 7.98] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - Statuses : 1 fail(s) 7 pass(s)
    - Exec time: [2.79, 18.39] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.67, 3.01] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [1.87, 8.92] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.42, 1.78] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-1:
    - Statuses : 1 dmesg-warn(s) 3 pass(s)
    - Exec time: [1.82, 3.03] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 7.67] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - Statuses : 1 fail(s) 7 pass(s)
    - Exec time: [2.78, 17.61] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.64, 5.33] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.23, 8.45] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.38, 1.70] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1:
    - Statuses : 1 dmesg-warn(s) 3 pass(s)
    - Exec time: [1.81, 3.30] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 7.66] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - Statuses : 1 fail(s) 7 pass(s)
    - Exec time: [2.77, 17.63] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.67, 5.36] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.57, 8.42] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.67] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.83, 2.39] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 7.66] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [3.13, 17.63] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [2.99, 8.39] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_11812 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][10] +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-kbl-8809g/igt@kms_async_flips@alternate-sync-async-flip.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][11] +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-elk-e7500/igt@kms_async_flips@alternate-sync-async-flip.html
    - bat-adlm-1:         NOTRUN -> [SKIP][12] ([i915#9900]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlm-1/igt@kms_async_flips@alternate-sync-async-flip.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][13] ([i915#10991]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-tgl-1115g4/igt@kms_async_flips@alternate-sync-async-flip.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#9792]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
    - bat-apl-1:          NOTRUN -> [DMESG-WARN][15] ([i915#180]) +23 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-apl-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][16] ([i915#9197]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-9/igt@kms_async_flips@async-flip-suspend-resume.html
    - bat-adlp-11:        NOTRUN -> [SKIP][17] ([i915#10470]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][18] +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-kbl-x1275/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs:
    - bat-arls-5:         NOTRUN -> [SKIP][19] ([i915#8709]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:
    - bat-twl-2:          NOTRUN -> [SKIP][20] ([i915#8709]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html
    - bat-twl-1:          NOTRUN -> [SKIP][21] ([i915#8709]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:
    - fi-rkl-11600:       NOTRUN -> [SKIP][22] ([i915#8709]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - bat-adls-6:         NOTRUN -> [SKIP][23] ([i915#8709]) +23 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adls-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][24] ([i915#8709]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][25] +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-cfl-8700k/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs:
    - bat-arls-1:         NOTRUN -> [SKIP][26] ([i915#8709]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs:
    - bat-dg2-11:         NOTRUN -> [SKIP][27] ([i915#8709]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear:
    - fi-glk-j4005:       NOTRUN -> [SKIP][28] +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-glk-j4005/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear:
    - fi-hsw-4770:        NOTRUN -> [SKIP][29] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-hsw-4770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear:
    - bat-apl-1:          NOTRUN -> [SKIP][30] +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-apl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-yf-ccs:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][31] +13 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-cfl-8109u/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs:
    - bat-arls-2:         NOTRUN -> [SKIP][32] ([i915#8709]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:
    - bat-mtlp-8:         NOTRUN -> [SKIP][33] ([i915#8709]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs:
    - bat-dg2-14:         NOTRUN -> [SKIP][34] ([i915#8709]) +11 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear:
    - fi-ivb-3770:        NOTRUN -> [SKIP][35] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-ivb-3770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html
    - fi-ilk-650:         NOTRUN -> [SKIP][36] +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-ilk-650/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs:
    - bat-adlp-9:         NOTRUN -> [SKIP][37] ([i915#8709]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs:
    - bat-jsl-1:          NOTRUN -> [SKIP][38] ([i915#8709]) +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:
    - fi-cfl-guc:         NOTRUN -> [SKIP][39] +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-cfl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs:
    - bat-dg1-7:          NOTRUN -> [SKIP][40] ([i915#8709]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-mc-ccs:
    - bat-adlp-6:         NOTRUN -> [SKIP][41] ([i915#8709]) +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc:
    - bat-rplp-1:         NOTRUN -> [SKIP][42] ([i915#8709]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - bat-kbl-2:          NOTRUN -> [SKIP][43] +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-kbl-2/igt@kms_async_flips@crc.html
    - bat-arlh-2:         NOTRUN -> [SKIP][44] ([i915#11346]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@invalid-async-flip:
    - bat-dg2-14:         NOTRUN -> [SKIP][45] ([i915#6228])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-14/igt@kms_async_flips@invalid-async-flip.html
    - bat-arls-5:         NOTRUN -> [SKIP][46] ([i915#6228])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-5/igt@kms_async_flips@invalid-async-flip.html
    - bat-dg2-11:         NOTRUN -> [SKIP][47] ([i915#6228])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-11/igt@kms_async_flips@invalid-async-flip.html
    - bat-arls-2:         NOTRUN -> [SKIP][48] ([i915#6228])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-2/igt@kms_async_flips@invalid-async-flip.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][49] ([i915#6228])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-8/igt@kms_async_flips@invalid-async-flip.html
    - bat-arls-1:         NOTRUN -> [SKIP][50] ([i915#6228])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - bat-adlp-11:        NOTRUN -> [SKIP][51] ([i915#10470] / [i915#10501]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-11/igt@kms_async_flips@test-cursor.html

  * igt@kms_async_flips@test-time-stamp:
    - fi-kbl-guc:         NOTRUN -> [SKIP][52] +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-kbl-guc/igt@kms_async_flips@test-time-stamp.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][53] +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-blb-e6850/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - bat-dg2-13:         NOTRUN -> [SKIP][54] ([i915#7828]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8032 -> IGTPW_11812

  CI-20190529: 20190529
  CI_DRM_15448: ec87b409d3a9358c9a079186d528fad3f7d64334 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11812: 11812
  IGT_8032: 8032

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/index.html

--===============3047812625286335468==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Async flips suspend resume test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138302/">https://patchwork.freedesktop.org/series/138302/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15448 -&gt; IGTPW_11812</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11812 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11812, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (1): bat-arls-1 <br />
  Missing    (2): bat-rpls-4 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11812:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-2/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-apl-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1 (NEW):</p>
<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-2/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-8/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-2/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-1/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-6/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_async_flips@test-cursor:<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-3/igt@kms_async_flips@test-cursor.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15448 and IGTPW_11812:</p>
<h3>New IGT tests (30)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 fail(s) 23 pass(s) 11 skip(s)</li>
<li>Exec time: [0.0, 72.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 3 pass(s)</li>
<li>Exec time: [1.83, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.50, 7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s) 7 pass(s)</li>
<li>Exec time: [2.79, 18.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.67, 3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.87, 8.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.42, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 3 pass(s)</li>
<li>Exec time: [1.82, 3.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s) 7 pass(s)</li>
<li>Exec time: [2.78, 17.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.64, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.23, 8.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.38, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 3 pass(s)</li>
<li>Exec time: [1.81, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 7.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s) 7 pass(s)</li>
<li>Exec time: [2.77, 17.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.67, 5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.57, 8.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.83, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 7.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [3.13, 17.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.99, 8.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11812 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-kbl-8809g/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-elk-e7500/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlm-1/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +6 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-tgl-1115g4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991">i915#10991</a>) +1 other test fail</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-apl-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-9/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +6 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-11/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-kbl-x1275/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +8 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-twl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-rkl-11600/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adls-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +23 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-tgl-1115g4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-cfl-8700k/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-yf-ccs.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-glk-j4005/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-linear.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-hsw-4770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-apl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-linear.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-yf-ccs:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-cfl-8109u/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1-yf-ccs.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-ivb-3770/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html">SKIP</a> +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-ilk-650/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1-linear.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1-y-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-jsl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-yf-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-cfl-guc/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg1-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-2-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-mc-ccs:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-rplp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-kbl-2/igt@kms_async_flips@crc.html">SKIP</a> +6 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arlh-2/igt@kms_async_flips@crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-14/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-mtlp-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-arls-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-adlp-11/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-kbl-guc/igt@kms_async_flips@test-time-stamp.html">SKIP</a> +6 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/fi-blb-e6850/igt@kms_async_flips@test-time-stamp.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11812/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8032 -&gt; IGTPW_11812</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15448: ec87b409d3a9358c9a079186d528fad3f7d64334 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11812: 11812<br />
  IGT_8032: 8032</p>

</body>
</html>

--===============3047812625286335468==--
