Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1892CE77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 14:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79F010E0A6;
	Tue, 31 Dec 2024 14:44:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BE510E07C;
 Tue, 31 Dec 2024 14:44:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_add_test_to_validate_uhbr?=
 =?utf-8?q?/non-uhbr_over_sst/mst?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Dec 2024 14:44:00 -0000
Message-ID: <173565624008.1331330.5127383315207763244@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
In-Reply-To: <20241231141518.765212-1-kunal1.joshi@intel.com>
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

== Series Details ==

Series: add test to validate uhbr/non-uhbr over sst/mst
URL   : https://patchwork.freedesktop.org/series/143039/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8173 -> IGTPW_12371
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12371 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12371, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12371:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_feature_discovery@non-uhbr-mst} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adls-6/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-jsl-1:          NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-arlh-3:         NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-3/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-adlp-9:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-9/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-arls-5:         NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arls-5/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-rplp-1:         NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rplp-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][7] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-rkl-11600/igt@kms_feature_discovery@non-uhbr-mst.html

  * {igt@kms_feature_discovery@non-uhbr-sst} (NEW):
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-9/igt@kms_feature_discovery@non-uhbr-sst.html
    - bat-jsl-3:          NOTRUN -> [SKIP][9] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-3/igt@kms_feature_discovery@non-uhbr-sst.html

  * {igt@kms_feature_discovery@uhbr-mst} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-8/igt@kms_feature_discovery@uhbr-mst.html
    - bat-dg2-8:          NOTRUN -> [SKIP][11] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-8/igt@kms_feature_discovery@uhbr-mst.html
    - {bat-arls-6}:       NOTRUN -> [SKIP][12] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arls-6/igt@kms_feature_discovery@uhbr-mst.html

  * {igt@kms_feature_discovery@uhbr-sst} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-7/igt@kms_feature_discovery@uhbr-sst.html
    - bat-adlp-11:        NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-11/igt@kms_feature_discovery@uhbr-sst.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-tgl-1115g4/igt@kms_feature_discovery@uhbr-sst.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-6/igt@kms_feature_discovery@uhbr-sst.html
    - bat-twl-2:          NOTRUN -> [SKIP][17] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-twl-2/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-14:         NOTRUN -> [SKIP][18] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-14/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-11:         NOTRUN -> [SKIP][19] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-11/igt@kms_feature_discovery@uhbr-sst.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - bat-rpls-4:         NOTRUN -> [SKIP][20] +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - {bat-mtlp-9}:       NOTRUN -> [INCOMPLETE][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between IGT_8173 and IGTPW_12371:

### New IGT tests (4) ###

  * igt@kms_feature_discovery@non-uhbr-mst:
    - Statuses : 1 pass(s) 37 skip(s)
    - Exec time: [0.0, 1.40] s

  * igt@kms_feature_discovery@non-uhbr-sst:
    - Statuses : 8 pass(s) 30 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_feature_discovery@uhbr-mst:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@kms_feature_discovery@uhbr-sst:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.29] s

  

Known issues
------------

  Here are the changes found in IGTPW_12371 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][22] ([i915#12904]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-pnv-d510/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][23] -> [DMESG-FAIL][24] ([i915#13393]) +1 other test dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8173/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - fi-cfl-guc:         NOTRUN -> [SKIP][25] +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][26] +12 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][27] ([i915#10470])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][28] +12 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg1-6:          NOTRUN -> [SKIP][29] ([i915#12311]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][30] ([i915#12402])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][31] ([i915#9792])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][32] ([i915#12402])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][33] ([i915#12402])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-jsl-3:          NOTRUN -> [SKIP][34] ([i915#12402])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][35] ([i915#12402])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][36] ([i915#12402])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-arlh-3:         NOTRUN -> [SKIP][37] ([i915#12402])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][38] ([i915#12402])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][39] ([i915#12402])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][40] ([i915#12402])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * {igt@kms_feature_discovery@non-uhbr-mst} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][41] ([i915#11346]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-2/igt@kms_feature_discovery@non-uhbr-mst.html

  * {igt@kms_feature_discovery@non-uhbr-sst} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][42] ([i915#6078]) +12 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-atsm-1/igt@kms_feature_discovery@non-uhbr-sst.html

  * {igt@kms_feature_discovery@uhbr-mst} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][43] +12 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-ivb-3770/igt@kms_feature_discovery@uhbr-mst.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][44] +12 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-elk-e7500/igt@kms_feature_discovery@uhbr-mst.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][45] +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-kbl-guc/igt@kms_feature_discovery@uhbr-mst.html

  * {igt@kms_feature_discovery@uhbr-sst} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][46] +10 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-kbl-7567u/igt@kms_feature_discovery@uhbr-sst.html

  * igt@kms_joiner@basic-big-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][47] ([i915#10656]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-3/igt@kms_joiner@basic-big-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][48] ([i915#10656]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adls-6/igt@kms_joiner@basic-big-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][49] ([i915#10656]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][50] ([i915#11575]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-3/igt@kms_joiner@basic-big-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][51] ([i915#10656]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-7/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][52] ([i915#10656]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-9/igt@kms_joiner@basic-big-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][53] ([i915#10656]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rpls-4/igt@kms_joiner@basic-big-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][54] ([i915#10656]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arls-5/igt@kms_joiner@basic-big-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][55] ([i915#10656]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rplp-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][56] ([i915#11346] / [i915#11575]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-2/igt@kms_joiner@basic-big-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][57] ([i915#10656]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-rkl-11600/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][58] ([i915#10656]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-11/igt@kms_joiner@basic-big-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][59] ([i915#10656] / [i915#12311]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-6/igt@kms_joiner@basic-big-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][60] ([i915#10656]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-tgl-1115g4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - fi-ilk-650:         NOTRUN -> [SKIP][61] +12 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-ilk-650/igt@kms_joiner@basic-force-big-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][62] ([i915#12388]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-tgl-1115g4/igt@kms_joiner@basic-force-big-joiner.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][63] +12 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-blb-e6850/igt@kms_joiner@basic-force-big-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][64] ([i915#12388]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-6/igt@kms_joiner@basic-force-big-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][65] ([i915#12388]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
    - bat-jsl-3:          NOTRUN -> [SKIP][66] ([i915#12388]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][67] ([i915#12394]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][68] ([i915#10656]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-dg2-8:          NOTRUN -> [SKIP][69] ([i915#10656]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][70] ([i915#12394]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adls-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][71] ([i915#12394]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][72] +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-cfl-8700k/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg2-14:         NOTRUN -> [SKIP][73] ([i915#12339]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-14/igt@kms_joiner@basic-ultra-joiner.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][74] +12 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-bsw-nick/igt@kms_joiner@basic-ultra-joiner.html
    - bat-kbl-2:          NOTRUN -> [SKIP][75] +12 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-kbl-2/igt@kms_joiner@basic-ultra-joiner.html
    - bat-jsl-3:          NOTRUN -> [SKIP][76] ([i915#12339]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-3/igt@kms_joiner@basic-ultra-joiner.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][77] ([i915#12339]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg2-8:          NOTRUN -> [SKIP][78] ([i915#12339]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-8/igt@kms_joiner@basic-ultra-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][79] ([i915#12339]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adls-6/igt@kms_joiner@basic-ultra-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][80] ([i915#12339]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][81] ([i915#12339]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-3/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][82] ([i915#12339]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-7/igt@kms_joiner@basic-ultra-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][83] ([i915#12339]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-9/igt@kms_joiner@basic-ultra-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][84] ([i915#12339]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rpls-4/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][85] ([i915#12339]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arls-5/igt@kms_joiner@basic-ultra-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][86] ([i915#12339]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rplp-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][87] ([i915#11346] / [i915#12339]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-2/igt@kms_joiner@basic-ultra-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][88] ([i915#12339]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-rkl-11600/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - bat-twl-2:          NOTRUN -> [SKIP][89] ([i915#10656]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-twl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][90] ([i915#10656]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-dg2-14:         NOTRUN -> [SKIP][91] ([i915#10656]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-14/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - fi-hsw-4770:        NOTRUN -> [SKIP][92] +12 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-hsw-4770/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][93] ([i915#12388]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adls-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][94] ([i915#12388]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-jsl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][95] ([i915#12388]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][96] ([i915#12388]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][97] ([i915#12388]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][98] ([i915#12388]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][99] ([i915#12311] / [i915#12388]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - bat-arlh-3:         NOTRUN -> [SKIP][100] ([i915#12394]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][101] +49 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-pnv-d510/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg1-7:          NOTRUN -> [SKIP][102] ([i915#12394]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][103] ([i915#12394]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][104] ([i915#12394]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arls-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][105] ([i915#12394]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-rplp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][106] ([i915#11346] / [i915#12394]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arlh-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][107] ([i915#12394]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][108] ([i915#12394]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][109] ([i915#10656]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][110] ([i915#12394]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][111] ([i915#12311] / [i915#12394]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-twl-2:          NOTRUN -> [SKIP][112] ([i915#12394]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-twl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - bat-adlp-11:        NOTRUN -> [SKIP][113] ([i915#12339]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-adlp-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][114] +10 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-cfl-8109u/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][115] ([i915#12311] / [i915#12339]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg1-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][116] ([i915#12339]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][117] ([i915#12339]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-mtlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-twl-2:          NOTRUN -> [SKIP][118] ([i915#12339]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-twl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][119] ([i915#12339]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-dg2-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][120] ([i915#13393]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8173/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8173 -> IGTPW_12371

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12371: f806aa1663b59c3c41d1344d5c9f1c7086f7cac0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8173: 27eea833bac15d1507eb4a864308644a60d60dc7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12371/index.html
