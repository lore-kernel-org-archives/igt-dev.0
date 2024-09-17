Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01AC35FF2
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 08:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE9F10E42F;
	Tue, 17 Sep 2024 08:25:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC1810E42F;
 Tue, 17 Sep 2024 08:25:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4624311638917745572=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv4=2C1/2=5D_tests/intel/kms=5Fpsr2=5Fsf=3A_Modify_kms=5Fpsr2?=
 =?utf-8?q?=5Fsf_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Sep 2024 08:25:09 -0000
Message-ID: <172656150962.1020922.17989215893607188556@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917051639.1162160-1-pranay.samala@intel.com>
In-Reply-To: <20240917051639.1162160-1-pranay.samala@intel.com>
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

--===============4624311638917745572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test
URL   : https://patchwork.freedesktop.org/series/138742/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15428 -> IGTPW_11747
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11747 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11747, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/index.html

Participating hosts (39 -> 33)
------------------------------

  Missing    (6): bat-dg1-7 bat-arlh-3 fi-snb-2520m fi-cfl-8109u fi-kbl-8809g bat-arls-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11747:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf (NEW):
    - bat-rpls-4:         NOTRUN -> [SKIP][1] +49 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-rpls-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - bat-twl-1:          NOTRUN -> [SKIP][2] +60 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-twl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][3] +49 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1 (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][4] +60 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-twl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][5] +60 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][6] +49 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1 (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][7] +60 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][8] +49 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-14/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][9] +49 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - bat-rplp-1:         NOTRUN -> [SKIP][10] +49 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-rplp-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][11] +49 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-tgl-1115g4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][12] +49 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlp-11/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][13] +49 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-11/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][14] +49 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arlh-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][15] +49 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-rkl-11600/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][16] +49 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-adlm-1:         NOTRUN -> [SKIP][17] +49 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlm-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-jsl-1:          NOTRUN -> [SKIP][18] +49 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-jsl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - bat-arls-1:         NOTRUN -> [SKIP][19] +49 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15428 and IGTPW_11747:

### New IGT tests (100) ###

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.33] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.43] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.87, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.88] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.86, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.88] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.23] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.17] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.89] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.27] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.84, 0.88] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.83, 0.88] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 skip(s)
    - Exec time: [1.21, 1.23] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 32 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 43.74] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.82, 21.73] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.78, 22.27] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 42.65] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.53, 21.33] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.58, 21.31] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 41.58] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.36, 20.78] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.30, 20.80] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 3.11] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.31, 1.56] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.34, 1.54] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 65.56] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [9.51, 32.78] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [9.45, 32.78] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 44.94] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.89, 22.47] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.88, 22.47] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 23.91] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [4.16, 11.96] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [4.16, 11.95] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 18.66] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.85, 9.34] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.90, 9.31] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 15.28] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.74, 7.61] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.70, 7.67] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 15.28] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.73, 7.61] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.71, 7.68] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 12.21] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.40, 6.12] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.37, 6.09] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 15.26] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 4 pass(s) 28 skip(s)
    - Exec time: [0.0, 15.84] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [7.02, 7.83] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.96, 8.00] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.75, 7.67] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.70, 7.61] s

  

Known issues
------------

  Here are the changes found in IGTPW_11747 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][20] +49 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-apl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][21] +49 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-kbl-7567u/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][22] +49 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-cfl-guc/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][23] +49 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-kbl-x1275/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][24] +49 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-cfl-8700k/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - bat-kbl-2:          NOTRUN -> [SKIP][25] +49 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-kbl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][26] +49 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-glk-j4005/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][27] +49 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-pnv-d510/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][28] +49 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-ivb-3770/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][29] +49 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-bsw-n3050/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][30] +49 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-ilk-650/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][31] +49 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-blb-e6850/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][32] +49 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-kbl-guc/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [INCOMPLETE][33] ([i915#11320]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15428/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [DMESG-WARN][35] ([i915#10341] / [i915#12133]) -> [ABORT][36] ([i915#12133] / [i915#12175])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15428/bat-arls-5/igt@i915_selftest@live.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-WARN][37] ([i915#10341] / [i915#11637]) -> [ABORT][38] ([i915#12061])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15428/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12175


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8022 -> IGTPW_11747

  CI-20190529: 20190529
  CI_DRM_15428: a2269b8bdf726c56f52e41ebfdd1cf38aea494de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11747: c974edd3aef9545436857dfe76a960cdfae7f4f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8022: 2d82f767a959d58c04ff3876d59d67924208d4ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/index.html

--===============4624311638917745572==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138742/">https://patchwork.freedesktop.org/series/138742/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15428 -&gt; IGTPW_11747</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11747 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11747, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/index.html</p>
<h2>Participating hosts (39 -&gt; 33)</h2>
<p>Missing    (6): bat-dg1-7 bat-arlh-3 fi-snb-2520m fi-cfl-8109u fi-kbl-8809g bat-arls-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11747:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf (NEW):</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-rpls-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-twl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1 (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-twl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1 (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-14/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-rplp-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-tgl-1115g4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlp-11/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-11/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arlh-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> +49 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-rkl-11600/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-dg2-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-adlm-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-jsl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15428 and IGTPW_11747:</p>
<h3>New IGT tests (100)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.87, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
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
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.88] s</li>
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
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.86, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.12] s</li>
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
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.17] s</li>
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
<li>Exec time: [1.21, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.84, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.83, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [1.21, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 43.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.82, 21.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.78, 22.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 42.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.53, 21.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.58, 21.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 41.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.36, 20.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.30, 20.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.31, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.34, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 65.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [9.51, 32.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [9.45, 32.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 44.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.89, 22.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.88, 22.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 23.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.16, 11.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.16, 11.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 18.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.85, 9.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.90, 9.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 15.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.74, 7.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.70, 7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 15.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.73, 7.61] s</li>
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
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 12.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [5.40, 6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [5.37, 6.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 15.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 4 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 15.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [7.02, 7.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.96, 8.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.75, 7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.70, 7.61] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11747 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-apl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-kbl-7567u/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-cfl-guc/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-kbl-x1275/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-cfl-8700k/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-kbl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-glk-j4005/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-pnv-d510/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-ivb-3770/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-bsw-n3050/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-ilk-650/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-blb-e6850/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/fi-kbl-guc/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15428/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15428/bat-arls-5/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12175">i915#12175</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15428/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11747/bat-arls-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8022 -&gt; IGTPW_11747</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15428: a2269b8bdf726c56f52e41ebfdd1cf38aea494de @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11747: c974edd3aef9545436857dfe76a960cdfae7f4f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8022: 2d82f767a959d58c04ff3876d59d67924208d4ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4624311638917745572==--
