Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A13CD343F
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 22:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FCB10E2CC;
	Tue, 12 May 2026 22:00:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0660D10E2CC;
 Tue, 12 May 2026 22:00:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9057692058568415359=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/kms=3A_Clean_up_forma?=
 =?utf-8?q?t+mod_stuff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 22:00:43 -0000
Message-ID: <177862324301.64651.7000888895040944770@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

--===============9057692058568415359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Clean up format+mod stuff
URL   : https://patchwork.freedesktop.org/series/166415/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8907 -> IGTPW_15165
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15165 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15165, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15165:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-dg2-14:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-14/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-14/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-dg2-8:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-8/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-8/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-mtlp-9:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-mtlp-9/igt@kms_addfb_basic@addfb25-4-tiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-mtlp-9/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-arls-6:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arls-6/igt@kms_addfb_basic@addfb25-4-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arls-6/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-mtlp-8:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-mtlp-8/igt@kms_addfb_basic@addfb25-4-tiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-mtlp-8/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-arls-5:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arls-5/igt@kms_addfb_basic@addfb25-4-tiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arls-5/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-arlh-2:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arlh-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arlh-2/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-arlh-3:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arlh-3/igt@kms_addfb_basic@addfb25-4-tiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arlh-3/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-dg2-9:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-9/igt@kms_addfb_basic@addfb25-4-tiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-9/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - fi-ilk-650:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-tgl-1115g4:      [PASS][21] -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-adlp-6:         [PASS][23] -> [FAIL][24] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-skl-6600u:       [PASS][25] -> [FAIL][26] +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-twl-2:          [PASS][27] -> [FAIL][28] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-cfl-8700k:       [PASS][29] -> [FAIL][30] +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-bsw-nick:        [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-bsw-nick/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-bsw-nick/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-kbl-2:          [PASS][33] -> [FAIL][34] +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-kbl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-kbl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-hsw-4770:        [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-ivb-3770:        [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-elk-e7500:       [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-bsw-n3050:       [PASS][41] -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - fi-pnv-d510:        [PASS][43] -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-pnv-d510/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-pnv-d510/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - bat-adlp-9:         [PASS][45] -> [FAIL][46] +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-twl-1:          [PASS][47] -> [FAIL][48] +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-rplp-1:         [PASS][49] -> [FAIL][50] +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - fi-rkl-11600:       [PASS][51] -> [FAIL][52] +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-dg1-7:          [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-adlp-11:        [PASS][55] -> [FAIL][56] +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-rpls-4:         [PASS][57] -> [FAIL][58] +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
    - bat-dg1-6:          [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-adlp-11:        [PASS][61] -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-tgl-1115g4:      [PASS][63] -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-adlp-6:         [PASS][65] -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-twl-2:          [PASS][67] -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg1-7:          [PASS][69] -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-adlp-9:         [PASS][71] -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-rpls-4:         [PASS][73] -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-twl-1:          [PASS][75] -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-jsl-5:          [PASS][77] -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-jsl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-jsl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-rplp-1:         [PASS][79] -> [SKIP][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-rkl-11600:       [PASS][81] -> [SKIP][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - fi-glk-j4005:       [PASS][83] -> [FAIL][84] +2 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-glk-j4005/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-glk-j4005/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-apl-1:          [PASS][85] -> [DMESG-FAIL][86] +2 other tests dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-kbl-x1275:       [PASS][87] -> [FAIL][88] +2 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-cfl-8109u:       [PASS][89] -> [FAIL][90] +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-kbl-7567u:       [PASS][91] -> [FAIL][92] +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-kbl-8809g:       [PASS][93] -> [FAIL][94] +2 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - bat-jsl-5:          [PASS][95] -> [FAIL][96] +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-jsl-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-jsl-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
    - fi-cfl-guc:         [PASS][97] -> [FAIL][98] +2 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-guc/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-guc/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  
Known issues
------------

  Here are the changes found in IGTPW_15165 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-skl-6600u:       NOTRUN -> [SKIP][99]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][100] -> [DMESG-FAIL][101] ([i915#12061]) +1 other test dmesg-fail
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-8/igt@i915_selftest@live.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][102] -> [DMESG-FAIL][103] ([i915#12061]) +1 other test dmesg-fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-kbl-x1275:       [PASS][104] -> [SKIP][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-cfl-8109u:       [PASS][106] -> [SKIP][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-kbl-8809g:       [PASS][108] -> [SKIP][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg1-6:          [PASS][110] -> [SKIP][111] ([i915#12311])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-skl-6600u:       [PASS][112] -> [SKIP][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-skl-6600u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-cfl-8700k:       [PASS][114] -> [SKIP][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-kbl-2:          [PASS][116] -> [SKIP][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-kbl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-kbl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-glk-j4005:       [PASS][118] -> [SKIP][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-glk-j4005/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-glk-j4005/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-kbl-7567u:       [PASS][120] -> [SKIP][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-apl-1:          [PASS][122] -> [SKIP][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-cfl-guc:         [PASS][124] -> [SKIP][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-guc/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-guc/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@too-high:
    - bat-apl-1:          [PASS][126] -> [DMESG-WARN][127] ([i915#13735]) +34 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_addfb_basic@too-high.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_addfb_basic@too-high.html

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - bat-apl-1:          [PASS][128] -> [DMESG-WARN][129] ([i915#13735] / [i915#180]) +30 other tests dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@coherency:
    - fi-skl-6600u:       [INCOMPLETE][130] -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-skl-6600u/igt@i915_selftest@live@coherency.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][132] ([i915#12061]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][134] ([i915#12061]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [SKIP][136] ([i915#13030]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8907 -> IGTPW_15165

  CI-20190529: 20190529
  CI_DRM_18478: 161329a551bb5ebd34524b781cd7fb3d84b994be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15165: 8a5f70a8bb58bc0f7c83d44fdc65890ad56d03b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/index.html

--===============9057692058568415359==
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
<tr><td><b>Series:</b></td><td>lib/kms: Clean up format+mod stuff</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166415/">https://patchwork.freedesktop.org/series/166415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8907 -&gt; IGTPW_15165</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15165 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15165, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15165:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-14/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-14/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-8/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-8/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-mtlp-9/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-mtlp-9/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arls-6/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arls-6/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-mtlp-8/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-mtlp-8/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arls-5/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arls-5/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arlh-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arlh-2/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arlh-3/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arlh-3/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-9/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-9/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-ilk-650/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-bsw-nick/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-bsw-nick/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-kbl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-kbl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-hsw-4770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-ivb-3770/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-elk-e7500/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-bsw-n3050/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-pnv-d510/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-pnv-d510/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-tgl-1115g4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-adlp-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rpls-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-twl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-jsl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-jsl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-rplp-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-rkl-11600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-glk-j4005/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-glk-j4005/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-jsl-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-jsl-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-guc/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-guc/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15165 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-x1275/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8109u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-8809g/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg1-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>)</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-skl-6600u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-8700k/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-kbl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-kbl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-glk-j4005/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-glk-j4005/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-cfl-guc/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-cfl-guc/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +34 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +30 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-skl-6600u/igt@i915_selftest@live@coherency.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-skl-6600u/igt@i915_selftest@live@coherency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8907/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15165/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8907 -&gt; IGTPW_15165</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18478: 161329a551bb5ebd34524b781cd7fb3d84b994be @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15165: 8a5f70a8bb58bc0f7c83d44fdc65890ad56d03b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9057692058568415359==--
