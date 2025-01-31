Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF2BC0218D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 07:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C407A10EA30;
	Fri, 31 Jan 2025 07:53:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528B210EA30;
 Fri, 31 Jan 2025 07:53:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8516905932958992810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/kms=5Fjoiner?=
 =?utf-8?q?=3A_Add_a_new_test_to_validate_non-joiner_mode_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jan 2025 07:53:18 -0000
Message-ID: <173830999832.3131849.8721193457014775693@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130172031.4126606-1-jeevan.b@intel.com>
In-Reply-To: <20250130172031.4126606-1-jeevan.b@intel.com>
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

--===============8516905932958992810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev4)
URL   : https://patchwork.freedesktop.org/series/143972/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8218 -> IGTPW_12525
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12525 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12525, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12525:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - bat-dg2-9:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@non-uhbr-mst (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-arlh-3:         NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-adlp-9:         NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-twl-1:          NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-arls-5:         NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-rplp-1:         NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][9] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_feature_discovery@non-uhbr-mst.html

  * igt@kms_feature_discovery@non-uhbr-sst (NEW):
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-9/igt@kms_feature_discovery@non-uhbr-sst.html
    - bat-jsl-3:          NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_feature_discovery@non-uhbr-sst.html

  * igt@kms_feature_discovery@uhbr-mst (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][12] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_feature_discovery@uhbr-mst.html
    - bat-dg2-8:          NOTRUN -> [SKIP][13] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-8/igt@kms_feature_discovery@uhbr-mst.html
    - {bat-arls-6}:       NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-6/igt@kms_feature_discovery@uhbr-mst.html

  * igt@kms_feature_discovery@uhbr-sst (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][15] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-9:          NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_feature_discovery@uhbr-sst.html
    - bat-adlp-11:        NOTRUN -> [SKIP][17] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_feature_discovery@uhbr-sst.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][18] +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_feature_discovery@uhbr-sst.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_feature_discovery@uhbr-sst.html
    - bat-twl-2:          NOTRUN -> [SKIP][20] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-14:         NOTRUN -> [SKIP][21] +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-14/igt@kms_feature_discovery@uhbr-sst.html
    - bat-adlp-6:         NOTRUN -> [SKIP][22] +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-11:         NOTRUN -> [SKIP][23] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_feature_discovery@uhbr-sst.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - bat-rpls-4:         NOTRUN -> [SKIP][24] +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  
New tests
---------

  New tests have been introduced between IGT_8218 and IGTPW_12525:

### New IGT tests (4) ###

  * igt@kms_feature_discovery@non-uhbr-mst:
    - Statuses : 1 pass(s) 40 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@kms_feature_discovery@non-uhbr-sst:
    - Statuses : 11 pass(s) 30 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@kms_feature_discovery@uhbr-mst:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@kms_feature_discovery@uhbr-sst:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 0.25] s

  

Known issues
------------

  Here are the changes found in IGTPW_12525 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][25] -> [INCOMPLETE][26] ([i915#12904]) +1 other test incomplete
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8218/bat-apl-1/igt@dmabuf@all-tests.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][27] -> [DMESG-FAIL][28] ([i915#12061]) +1 other test dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8218/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - fi-cfl-guc:         NOTRUN -> [SKIP][29] +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][30] +12 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][31] ([i915#10470])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][32] +12 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg1-6:          NOTRUN -> [SKIP][33] ([i915#12311]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][34] ([i915#12402])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][35] ([i915#9792])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][36] ([i915#12402])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][37] ([i915#12402])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-jsl-3:          NOTRUN -> [SKIP][38] ([i915#12402])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][39] ([i915#12402])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][40] ([i915#12402])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-arlh-3:         NOTRUN -> [SKIP][41] ([i915#12402])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][42] ([i915#12402])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][43] ([i915#12402])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][44] ([i915#12402])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][45] ([i915#12402])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@non-uhbr-mst (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][46] ([i915#11346]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_feature_discovery@non-uhbr-mst.html

  * igt@kms_feature_discovery@non-uhbr-sst (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][47] ([i915#6078]) +12 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-atsm-1/igt@kms_feature_discovery@non-uhbr-sst.html

  * igt@kms_feature_discovery@uhbr-mst (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] +12 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-ivb-3770/igt@kms_feature_discovery@uhbr-mst.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][49] +12 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-elk-e7500/igt@kms_feature_discovery@uhbr-mst.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][50] +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-guc/igt@kms_feature_discovery@uhbr-mst.html

  * igt@kms_feature_discovery@uhbr-sst (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][51] +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-7567u/igt@kms_feature_discovery@uhbr-sst.html

  * igt@kms_joiner@basic-big-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][52] ([i915#10656]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-big-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][53] ([i915#10656]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@basic-big-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][54] ([i915#10656]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][55] ([i915#11575]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_joiner@basic-big-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][56] ([i915#10656]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][57] ([i915#10656]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_joiner@basic-big-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][58] ([i915#10656]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@basic-big-joiner.html
    - bat-twl-1:          NOTRUN -> [SKIP][59] ([i915#10656]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][60] ([i915#10656]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_joiner@basic-big-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][61] ([i915#10656]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][62] ([i915#11346] / [i915#11575]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_joiner@basic-big-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][63] ([i915#10656]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][64] ([i915#10656]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@basic-big-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][65] ([i915#10656] / [i915#12311]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@basic-big-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][66] ([i915#10656]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-6:         NOTRUN -> [SKIP][67] ([i915#10656]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - fi-ilk-650:         NOTRUN -> [SKIP][68] +12 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-ilk-650/igt@kms_joiner@basic-force-big-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][69] ([i915#12388]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@basic-force-big-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][70] ([i915#12388]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_joiner@basic-force-big-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][71] ([i915#12388]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
    - bat-jsl-3:          NOTRUN -> [SKIP][72] ([i915#12388]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][73] ([i915#12394]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][74] ([i915#10656]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-dg2-8:          NOTRUN -> [SKIP][75] ([i915#10656]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][76] ([i915#12394]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][77] ([i915#12394]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][78] +12 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-cfl-8700k/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg2-14:         NOTRUN -> [SKIP][79] ([i915#12339]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-14/igt@kms_joiner@basic-ultra-joiner.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][80] +12 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-bsw-nick/igt@kms_joiner@basic-ultra-joiner.html
    - bat-kbl-2:          NOTRUN -> [SKIP][81] +12 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-kbl-2/igt@kms_joiner@basic-ultra-joiner.html
    - bat-jsl-3:          NOTRUN -> [SKIP][82] ([i915#12339]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-ultra-joiner.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][83] ([i915#12339]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg2-8:          NOTRUN -> [SKIP][84] ([i915#12339]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-8/igt@kms_joiner@basic-ultra-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][85] ([i915#12339]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@basic-ultra-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][86] ([i915#12339]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][87] ([i915#12339]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][88] ([i915#12339]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@basic-ultra-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][89] ([i915#12339]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_joiner@basic-ultra-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][90] ([i915#12339]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@basic-ultra-joiner.html
    - bat-twl-1:          NOTRUN -> [SKIP][91] ([i915#12339]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][92] ([i915#12339]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_joiner@basic-ultra-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][93] ([i915#12339]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][94] ([i915#11346] / [i915#12339]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_joiner@basic-ultra-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][95] ([i915#12339]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - bat-twl-2:          NOTRUN -> [SKIP][96] ([i915#10656]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][97] ([i915#10656]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-dg2-14:         NOTRUN -> [SKIP][98] ([i915#10656]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-14/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - fi-hsw-4770:        NOTRUN -> [SKIP][99] +12 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-hsw-4770/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][100] ([i915#12388]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][101] ([i915#12388]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][102] ([i915#12388]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][103] ([i915#12388]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][104] ([i915#12388]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][105] ([i915#12388]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][106] ([i915#12311] / [i915#12388]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][107] +12 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-bsw-n3050/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][108] ([i915#12394]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][109] ([i915#12394]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][110] ([i915#12394]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-twl-1:          NOTRUN -> [SKIP][111] ([i915#12394]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-apl-1:          NOTRUN -> [SKIP][112] +10 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-apl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][113] ([i915#12394]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][114] ([i915#12394]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][115] ([i915#11346] / [i915#12394]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][116] ([i915#12394]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][117] ([i915#12394]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][118] ([i915#10656]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg2-9:          NOTRUN -> [SKIP][119] ([i915#10656]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][120] ([i915#12394]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][121] ([i915#12311] / [i915#12394]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-6:         NOTRUN -> [SKIP][122] ([i915#12394]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-twl-2:          NOTRUN -> [SKIP][123] ([i915#12394]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - bat-dg2-9:          NOTRUN -> [SKIP][124] ([i915#12339]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][125] ([i915#12339]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][126] +10 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-cfl-8109u/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][127] ([i915#12311] / [i915#12339]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][128] ([i915#12339]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-adlp-6:         NOTRUN -> [SKIP][129] ([i915#12339]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][130] ([i915#12339]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-twl-2:          NOTRUN -> [SKIP][131] ([i915#12339]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][132] ([i915#12339]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][133] ([i915#12061]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8218/bat-mtlp-8/igt@i915_selftest@live.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@i915_selftest@live.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8218 -> IGTPW_12525
  * Linux: CI_DRM_16041 -> CI_DRM_16047

  CI-20190529: 20190529
  CI_DRM_16041: c2a5da40b8b1c5af77dcdabed8516069949fea3b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16047: 0c2a60e7f1e779d87754254d9e3443beedbb684e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12525: 12525
  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/index.html

--===============8516905932958992810==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143972/">https://patchwork.freedesktop.org/series/143972/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8218 -&gt; IGTPW_12525</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12525 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12525, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12525:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst (NEW):</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-9/igt@kms_feature_discovery@non-uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_feature_discovery@non-uhbr-sst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-8/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>{bat-arls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-6/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-14/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8218 and IGTPW_12525:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst:</p>
<ul>
<li>Statuses : 11 pass(s) 30 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12525 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8218/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8218/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> +12 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> +12 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> +12 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +4 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-atsm-1/igt@kms_feature_discovery@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-ivb-3770/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +12 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-elk-e7500/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +12 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-guc/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-kbl-7567u/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575">i915#11575</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575">i915#11575</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-ilk-650/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> +12 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-cfl-8700k/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-14/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-bsw-nick/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-kbl-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-14/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-hsw-4770/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adls-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-jsl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-bsw-n3050/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-apl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +10 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arls-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-rplp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-arlh-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-cfl-8109u/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> +10 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg1-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-adlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-twl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-dg2-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8218/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12525/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8218 -&gt; IGTPW_12525</li>
<li>Linux: CI_DRM_16041 -&gt; CI_DRM_16047</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16041: c2a5da40b8b1c5af77dcdabed8516069949fea3b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16047: 0c2a60e7f1e779d87754254d9e3443beedbb684e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12525: 12525<br />
  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8516905932958992810==--
