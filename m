Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6005CE7AA2
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 22:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883E710E3F7;
	Thu,  5 Sep 2024 22:59:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645C410E165;
 Thu,  5 Sep 2024 22:59:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1307932767266034325=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/2=5D_tests/intel/kms=5Fpsr2=5Fsf=3A_Modify_kms=5Fpsr2?=
 =?utf-8?q?=5Fsf_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Sep 2024 22:59:52 -0000
Message-ID: <172557719240.952417.15588562607721573773@2413ebb6fbb6>
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

--===============1307932767266034325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test
URL   : https://patchwork.freedesktop.org/series/138264/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15369 -> IGTPW_11705
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (2): fi-glk-j4005 fi-elk-e7500 
  Missing    (3): bat-mtlp-8 bat-arlh-3 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11705:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf} (NEW):
    - bat-rpls-4:         NOTRUN -> [SKIP][1] +49 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-rpls-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - bat-twl-1:          NOTRUN -> [SKIP][2] +60 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-twl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * {igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area} (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][3] +49 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][4] +60 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-twl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * {igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] +49 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][6] +49 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][7] +60 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][8] +49 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-14/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][9] +49 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - bat-rplp-1:         NOTRUN -> [SKIP][10] +49 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-rplp-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][11] +49 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-tgl-1115g4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf} (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][12] +49 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlp-11/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][13] +49 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-11/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * {igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area} (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][14] +60 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][15] +49 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg1-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][16] +49 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arlh-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] +49 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-rkl-11600/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * {igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][18] +49 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-adls-6:         NOTRUN -> [SKIP][19] +49 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adls-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-adlm-1:         NOTRUN -> [SKIP][20] +49 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlm-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-jsl-1:          NOTRUN -> [SKIP][21] +49 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-jsl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-arls-1:         NOTRUN -> [SKIP][22] +49 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15369 and IGTPW_11705:

### New IGT tests (100) ###

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.85, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.85, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.24] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.26] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.26] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.26] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.25] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.18] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.28] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.90] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.24] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.24] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 42.96] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.82, 21.49] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.78, 21.46] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 42.10] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.54, 21.06] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.58, 21.04] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 41.07] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.28, 20.52] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.33, 20.54] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 2.97] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.36, 1.51] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.35, 1.48] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 64.69] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [9.46, 32.34] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [9.46, 32.35] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 44.41] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.89, 22.20] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.87, 22.20] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 23.67] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [4.09, 11.83] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [4.15, 11.83] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 4.29] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.69, 2.16] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.67, 2.13] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 15.22] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.74, 7.66] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.70, 7.56] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 15.27] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.74, 7.59] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.71, 7.68] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 12.16] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.39, 6.08] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.38, 6.08] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 15.29] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 4 pass(s) 34 skip(s)
    - Exec time: [0.0, 15.86] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.96, 7.98] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.97, 7.87] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.73, 7.67] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.71, 7.61] s

  

Known issues
------------

  Here are the changes found in IGTPW_11705 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - bat-arls-1:         [PASS][23] -> [DMESG-FAIL][24] ([i915#12102])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15369/bat-arls-1/igt@fbdev@read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-1/igt@fbdev@read.html

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][25] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][26] ([i915#4613]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * {igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][27] ([i915#6078]) +49 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-atsm-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf} (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][28] +49 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-apl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * {igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][29] +49 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-7567u/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * {igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][30] +49 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-cfl-guc/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][31] +49 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-x1275/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][32] +49 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-cfl-8700k/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - bat-kbl-2:          NOTRUN -> [SKIP][33] +49 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-kbl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@pr-cursor-plane-update-sf} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][34] +60 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-glk-j4005/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * {igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][35] +49 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-cfl-8109u/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][36] +49 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-pnv-d510/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][37] +49 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-ivb-3770/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][38] +49 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-bsw-n3050/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * {igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][39] +49 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-ilk-650/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][40] +49 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-blb-e6850/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][41] +75 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-elk-e7500/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][42] +49 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-guc/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - bat-arls-1:         [DMESG-WARN][43] ([i915#12102]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15369/bat-arls-1/igt@fbdev@info.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-1/igt@fbdev@info.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [DMESG-WARN][45] ([i915#180] / [i915#9925]) -> [DMESG-WARN][46] ([i915#180] / [i915#1982] / [i915#9925]) +1 other test dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15369/fi-kbl-7567u/igt@i915_module_load@reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-7567u/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8006 -> IGTPW_11705

  CI-20190529: 20190529
  CI_DRM_15369: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11705: 539b0fdc2a085a40bdd202a2e61553f0149550f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/index.html

--===============1307932767266034325==
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

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15369 -&gt; IGTPW_11705</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (2): fi-glk-j4005 fi-elk-e7500 <br />
  Missing    (3): bat-mtlp-8 bat-arlh-3 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11705:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf} (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-rpls-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-twl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-twl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf} (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-14/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-rplp-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-tgl-1115g4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlp-11/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf} (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-11/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg1-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf} (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arlh-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> +49 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-rkl-11600/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-dg2-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adls-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-adlm-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-jsl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15369 and IGTPW_11705:</p>
<h3>New IGT tests (100)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.85, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.85, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 42.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.82, 21.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.78, 21.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 42.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.54, 21.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.58, 21.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 41.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.28, 20.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.33, 20.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.36, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.35, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 64.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [9.46, 32.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [9.46, 32.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 44.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.89, 22.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.87, 22.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 23.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.09, 11.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.15, 11.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.69, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.67, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 15.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.74, 7.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.70, 7.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 15.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.74, 7.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.71, 7.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 12.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [5.39, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [5.38, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 15.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 4 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0, 15.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.96, 7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.97, 7.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.73, 7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.71, 7.61] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11705 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15369/bat-arls-1/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-1/igt@fbdev@read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-atsm-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-apl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-7567u/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-cfl-guc/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-x1275/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-cfl-8700k/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-kbl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-cursor-plane-update-sf} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-glk-j4005/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-cfl-8109u/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-pnv-d510/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-ivb-3770/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-bsw-n3050/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-ilk-650/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-blb-e6850/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-elk-e7500/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +75 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-guc/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@fbdev@info:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15369/bat-arls-1/igt@fbdev@info.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/bat-arls-1/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15369/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11705/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8006 -&gt; IGTPW_11705</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15369: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11705: 539b0fdc2a085a40bdd202a2e61553f0149550f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1307932767266034325==--
