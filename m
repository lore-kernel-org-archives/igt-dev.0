Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742BCE7AA1
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 22:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5429310E166;
	Thu,  5 Sep 2024 22:59:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA1F10E165;
 Thu,  5 Sep 2024 22:59:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5969819139112807527=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv3=2C1/2=5D_tests/intel/kms=5Fpsr2=5Fsf=3A_Modify_kms=5Fpsr2?=
 =?utf-8?q?=5Fsf_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Sep 2024 22:59:00 -0000
Message-ID: <172557714088.952326.15517217809083900652@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905134259.1155164-1-pranay.samala@intel.com>
In-Reply-To: <20240905134259.1155164-1-pranay.samala@intel.com>
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

--===============5969819139112807527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test
URL   : https://patchwork.freedesktop.org/series/138264/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8006_BAT -> XEIGTPW_11705_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11705_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] +49 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-dg2-oem2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf} (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][2] +49 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-adlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * {igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf} (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][4] +49 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * {igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf} (NEW):
    - {bat-bmg-2}:        NOTRUN -> [SKIP][5] +49 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * {igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area} (NEW):
    - bat-adlp-vf:        NOTRUN -> [SKIP][6] +49 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-adlp-vf/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  
New tests
---------

  New tests have been introduced between XEIGT_8006_BAT and XEIGTPW_11705_BAT:

### New IGT tests (100) ###

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.23] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.96] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.17] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.90] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.19] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.92] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.26] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.95] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.31] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.24] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.97] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.23] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.92] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.30] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.22] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.97] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.18] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.92] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.23] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.94] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.28] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.28] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.94] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.34] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.21] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.90] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.30] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 2.27] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.98] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.28] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 17.37] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.66] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.70] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 16.78] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.40] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.38] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 16.08] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.05] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.03] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 2.97] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 24.26] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.13] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.13] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 17.52] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.77] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.75] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 10.35] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.16] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.19] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 3.91] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 14.94] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.55] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.39] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 14.98] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.44] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.53] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 12.03] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.04] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.99] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 15.0] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 22.30] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.37] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.93] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.52] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.48] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11705_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#1024]) +49 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-atsm-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#455]) +48 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-adlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#1024]) +49 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-pvc-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8006 -> IGTPW_11705
  * Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -> xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d

  IGTPW_11705: 539b0fdc2a085a40bdd202a2e61553f0149550f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/index.html

--===============5969819139112807527==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138264/">https://patchwork.freedesktop.org/series/138264/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8006_BAT -&gt; XEIGTPW_11705_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11705_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-dg2-oem2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-adlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf} (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf} (NEW):</p>
<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-adlp-vf/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8006_BAT and XEIGTPW_11705_BAT:</p>
<h3>New IGT tests (100)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 17.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 16.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 16.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 24.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 17.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 10.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 14.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 14.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 12.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 15.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 22.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.48] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11705_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-atsm-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-adlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/bat-pvc-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +49 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8006 -&gt; IGTPW_11705</li>
<li>Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -&gt; xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d</li>
</ul>
<p>IGTPW_11705: 539b0fdc2a085a40bdd202a2e61553f0149550f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581<br />
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d</p>

</body>
</html>

--===============5969819139112807527==--
