Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B0FC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 10:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25A810E050;
	Wed, 15 Jan 2025 10:40:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A9C10E050;
 Wed, 15 Jan 2025 10:40:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2136147377361540581=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_add_test_to_validate_uhbr?=
 =?utf-8?q?/non-uhbr_over_sst/mst_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jan 2025 10:40:45 -0000
Message-ID: <173693764520.3912472.13893993869068388293@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
In-Reply-To: <20250115073243.2002014-1-kunal1.joshi@intel.com>
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

--===============2136147377361540581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate uhbr/non-uhbr over sst/mst (rev2)
URL   : https://patchwork.freedesktop.org/series/143039/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8190 -> IGTPW_12440
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12440 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12440, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-adlp-6 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12440:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - bat-dg2-9:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@non-uhbr-mst (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-jsl-1:          NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-arlh-3:         NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-adlp-9:         NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-twl-1:          NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-arls-5:         NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-rplp-1:         NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_feature_discovery@non-uhbr-mst.html

  * igt@kms_feature_discovery@non-uhbr-sst (NEW):
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][12] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-9/igt@kms_feature_discovery@non-uhbr-sst.html
    - bat-jsl-3:          NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_feature_discovery@non-uhbr-sst.html

  * igt@kms_feature_discovery@uhbr-mst (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_feature_discovery@uhbr-mst.html
    - bat-dg2-8:          NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-8/igt@kms_feature_discovery@uhbr-mst.html
    - {bat-arls-6}:       NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-6/igt@kms_feature_discovery@uhbr-mst.html

  * igt@kms_feature_discovery@uhbr-sst (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][17] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_feature_discovery@uhbr-sst.html
    - bat-adlp-11:        NOTRUN -> [SKIP][18] +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_feature_discovery@uhbr-sst.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][19] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_feature_discovery@uhbr-sst.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][20] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_feature_discovery@uhbr-sst.html
    - bat-twl-2:          NOTRUN -> [SKIP][21] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-11:         NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_feature_discovery@uhbr-sst.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - bat-rpls-4:         NOTRUN -> [SKIP][23] +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  
New tests
---------

  New tests have been introduced between IGT_8190 and IGTPW_12440:

### New IGT tests (4) ###

  * igt@kms_feature_discovery@non-uhbr-mst:
    - Statuses : 1 pass(s) 37 skip(s)
    - Exec time: [0.0, 1.47] s

  * igt@kms_feature_discovery@non-uhbr-sst:
    - Statuses : 9 pass(s) 29 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_feature_discovery@uhbr-mst:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@kms_feature_discovery@uhbr-sst:
    - Statuses : 38 skip(s)
    - Exec time: [0.0, 0.25] s

  

Known issues
------------

  Here are the changes found in IGTPW_12440 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][24] -> [DMESG-FAIL][25] ([i915#13393]) +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-mtlp-8/igt@i915_selftest@live.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - fi-cfl-guc:         NOTRUN -> [SKIP][26] +12 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][27] +12 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][28] ([i915#10470])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][29] +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg1-6:          NOTRUN -> [SKIP][30] ([i915#12311]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][31] ([i915#12402])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][32] ([i915#9792])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][33] ([i915#12402])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][34] ([i915#12402])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-jsl-3:          NOTRUN -> [SKIP][35] ([i915#12402])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][36] ([i915#12402])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][37] ([i915#12402])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-arlh-3:         NOTRUN -> [SKIP][38] ([i915#12402])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][39] ([i915#12402])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][40] ([i915#12402])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][41] ([i915#12402])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@non-uhbr-mst (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][42] ([i915#11346]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_feature_discovery@non-uhbr-mst.html

  * igt@kms_feature_discovery@non-uhbr-sst (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][43] ([i915#6078]) +12 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-atsm-1/igt@kms_feature_discovery@non-uhbr-sst.html

  * igt@kms_feature_discovery@uhbr-mst (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][44] +12 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-ivb-3770/igt@kms_feature_discovery@uhbr-mst.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][45] +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-elk-e7500/igt@kms_feature_discovery@uhbr-mst.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][46] +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-guc/igt@kms_feature_discovery@uhbr-mst.html

  * igt@kms_feature_discovery@uhbr-sst (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][47] +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-7567u/igt@kms_feature_discovery@uhbr-sst.html

  * igt@kms_joiner@basic-big-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][48] ([i915#10656]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-big-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][49] ([i915#10656]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@basic-big-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][50] ([i915#10656]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][51] ([i915#11575]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][52] ([i915#10656]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_joiner@basic-big-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][53] ([i915#10656]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@basic-big-joiner.html
    - bat-twl-1:          NOTRUN -> [SKIP][54] ([i915#10656]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][55] ([i915#10656]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_joiner@basic-big-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][56] ([i915#10656]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_joiner@basic-big-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][57] ([i915#11346] / [i915#11575]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_joiner@basic-big-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][58] ([i915#10656]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@basic-big-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][59] ([i915#10656]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@basic-big-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][60] ([i915#10656] / [i915#12311]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@basic-big-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][61] ([i915#10656]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - fi-ilk-650:         NOTRUN -> [SKIP][62] +12 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-ilk-650/igt@kms_joiner@basic-force-big-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][63] ([i915#12388]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@basic-force-big-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][64] ([i915#12388]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_joiner@basic-force-big-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][65] ([i915#12388]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
    - bat-jsl-3:          NOTRUN -> [SKIP][66] ([i915#12388]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - bat-jsl-3:          NOTRUN -> [SKIP][67] ([i915#12394]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][68] ([i915#10656]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-dg2-8:          NOTRUN -> [SKIP][69] ([i915#10656]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][70] ([i915#12394]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][71] ([i915#12394]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][72] +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-cfl-8700k/igt@kms_joiner@basic-ultra-joiner.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][73] +12 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-bsw-nick/igt@kms_joiner@basic-ultra-joiner.html
    - bat-kbl-2:          NOTRUN -> [SKIP][74] +12 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-kbl-2/igt@kms_joiner@basic-ultra-joiner.html
    - bat-jsl-3:          NOTRUN -> [SKIP][75] ([i915#12339]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-ultra-joiner.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][76] ([i915#12339]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html
    - bat-dg2-8:          NOTRUN -> [SKIP][77] ([i915#12339]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-8/igt@kms_joiner@basic-ultra-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][78] ([i915#12339]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@basic-ultra-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][79] ([i915#12339]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arlh-3:         NOTRUN -> [SKIP][80] ([i915#12339]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_joiner@basic-ultra-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][81] ([i915#12339]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_joiner@basic-ultra-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][82] ([i915#12339]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@basic-ultra-joiner.html
    - bat-twl-1:          NOTRUN -> [SKIP][83] ([i915#12339]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][84] ([i915#12339]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_joiner@basic-ultra-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][85] ([i915#12339]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][86] ([i915#11346] / [i915#12339]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_joiner@basic-ultra-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][87] ([i915#12339]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - bat-twl-2:          NOTRUN -> [SKIP][88] ([i915#10656]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][89] ([i915#10656]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - fi-hsw-4770:        NOTRUN -> [SKIP][90] +12 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-hsw-4770/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-adls-6:         NOTRUN -> [SKIP][91] ([i915#12388]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-jsl-1:          NOTRUN -> [SKIP][92] ([i915#12388]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-rpls-4:         NOTRUN -> [SKIP][93] ([i915#12388]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][94] ([i915#12388]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][95] ([i915#12388]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][96] ([i915#12311] / [i915#12388]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - bat-arlh-3:         NOTRUN -> [SKIP][97] ([i915#12394]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][98] +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-glk-j4005/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-9:         NOTRUN -> [SKIP][99] ([i915#12394]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-twl-1:          NOTRUN -> [SKIP][100] ([i915#12394]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-apl-1:          NOTRUN -> [SKIP][101] +10 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arls-5:         NOTRUN -> [SKIP][102] ([i915#12394]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-rplp-1:         NOTRUN -> [SKIP][103] ([i915#12394]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-arlh-2:         NOTRUN -> [SKIP][104] ([i915#11346] / [i915#12394]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][105] ([i915#12394]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][106] ([i915#12394]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][107] ([i915#10656]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg2-9:          NOTRUN -> [SKIP][108] ([i915#10656]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][109] ([i915#12394]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][110] ([i915#12311] / [i915#12394]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-twl-2:          NOTRUN -> [SKIP][111] ([i915#12394]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - bat-dg2-9:          NOTRUN -> [SKIP][112] ([i915#12339]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-adlp-11:        NOTRUN -> [SKIP][113] ([i915#12339]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][114] +10 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-cfl-8109u/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg1-6:          NOTRUN -> [SKIP][115] ([i915#12311] / [i915#12339]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][116] ([i915#12339]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][117] ([i915#12339]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-twl-2:          NOTRUN -> [SKIP][118] ([i915#12339]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg2-11:         NOTRUN -> [SKIP][119] ([i915#12339]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - {bat-mtlp-9}:       [DMESG-WARN][120] ([i915#13494]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-mtlp-9/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - bat-apl-1:          [DMESG-WARN][122] ([i915#11621] / [i915#180] / [i915#1982]) -> [PASS][123] +4 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-apl-1/igt@i915_module_load@reload.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [DMESG-WARN][124] ([i915#11621]) -> [PASS][125] +79 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][126] ([i915#13393]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [DMESG-WARN][128] ([i915#11621] / [i915#180]) -> [PASS][129] +44 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8190 -> IGTPW_12440
  * Linux: CI_DRM_15951 -> CI_DRM_15959

  CI-20190529: 20190529
  CI_DRM_15951: 1c464719f6d86a08c91e6ed5d64db83b166788db @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15959: 1add93ce0468986a45532aa0a83e7c5976110d7b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12440: 12440
  IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/index.html

--===============2136147377361540581==
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
<tr><td><b>Series:</b></td><td>add test to validate uhbr/non-uhbr over sst/mst (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143039/">https://patchwork.freedesktop.org/series/143039/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8190 -&gt; IGTPW_12440</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12440 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12440, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-adlp-6 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12440:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst (NEW):</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-9/igt@kms_feature_discovery@non-uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_feature_discovery@non-uhbr-sst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-8/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>{bat-arls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-6/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8190 and IGTPW_12440:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst:</p>
<ul>
<li>Statuses : 1 pass(s) 37 skip(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst:</p>
<ul>
<li>Statuses : 9 pass(s) 29 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12440 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> +12 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> +12 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> +12 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +4 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-atsm-1/igt@kms_feature_discovery@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-ivb-3770/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +12 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-elk-e7500/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +12 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-guc/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-kbl-7567u/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575">i915#11575</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11575">i915#11575</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-ilk-650/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> +12 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-cfl-8700k/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-bsw-nick/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-kbl-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-hsw-4770/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adls-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-jsl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rpls-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-glk-j4005/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +12 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +10 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arls-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-rplp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-rkl-11600/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-adlp-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-cfl-8109u/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> +10 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg1-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/fi-tgl-1115g4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-twl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-dg2-11/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@i915_module_load@reload.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8190/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12440/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8190 -&gt; IGTPW_12440</li>
<li>Linux: CI_DRM_15951 -&gt; CI_DRM_15959</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15951: 1c464719f6d86a08c91e6ed5d64db83b166788db @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15959: 1add93ce0468986a45532aa0a83e7c5976110d7b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12440: 12440<br />
  IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2136147377361540581==--
