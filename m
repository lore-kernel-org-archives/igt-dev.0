Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE44C54751
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 08:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F253610E42D;
	Wed, 28 Aug 2024 08:52:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3029710E42D;
 Wed, 28 Aug 2024 08:52:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5374541106299598069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_runner/executor=2Ec=3A_Dete?=
 =?utf-8?q?ct_tests_killed_by_a_signal?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Aug 2024 08:52:43 -0000
Message-ID: <172483516318.809585.17353334825725594847@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
In-Reply-To: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
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

--===============5374541106299598069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/executor.c: Detect tests killed by a signal
URL   : https://patchwork.freedesktop.org/series/137879/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15307 -> IGTPW_11650
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11650 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11650, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (1): bat-arlh-3 
  Missing    (4): fi-kbl-7567u bat-arlh-2 fi-snb-2520m fi-kbl-8809g 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11650:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_pread_basic:
    - bat-kbl-2:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-kbl-2/igt@gem_tiled_pread_basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-kbl-2/igt@gem_tiled_pread_basic.html
    - fi-pnv-d510:        [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-pnv-d510/igt@gem_tiled_pread_basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-pnv-d510/igt@gem_tiled_pread_basic.html
    - fi-glk-j4005:       [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-glk-j4005/igt@gem_tiled_pread_basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-glk-j4005/igt@gem_tiled_pread_basic.html
    - fi-kbl-x1275:       [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-kbl-x1275/igt@gem_tiled_pread_basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-kbl-x1275/igt@gem_tiled_pread_basic.html
    - fi-cfl-8109u:       [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-cfl-8109u/igt@gem_tiled_pread_basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-cfl-8109u/igt@gem_tiled_pread_basic.html
    - fi-ivb-3770:        [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-ivb-3770/igt@gem_tiled_pread_basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-ivb-3770/igt@gem_tiled_pread_basic.html
    - bat-apl-1:          [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@gem_tiled_pread_basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@gem_tiled_pread_basic.html
    - fi-elk-e7500:       [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-elk-e7500/igt@gem_tiled_pread_basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-elk-e7500/igt@gem_tiled_pread_basic.html
    - fi-kbl-guc:         [PASS][17] -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-kbl-guc/igt@gem_tiled_pread_basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-kbl-guc/igt@gem_tiled_pread_basic.html
    - fi-ilk-650:         [PASS][19] -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-ilk-650/igt@gem_tiled_pread_basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-ilk-650/igt@gem_tiled_pread_basic.html
    - fi-tgl-1115g4:      [PASS][21] -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-tgl-1115g4/igt@gem_tiled_pread_basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-tgl-1115g4/igt@gem_tiled_pread_basic.html
    - fi-bsw-n3050:       [PASS][23] -> [FAIL][24] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-bsw-n3050/igt@gem_tiled_pread_basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-bsw-n3050/igt@gem_tiled_pread_basic.html
    - fi-cfl-8700k:       [PASS][25] -> [FAIL][26] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-cfl-8700k/igt@gem_tiled_pread_basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-cfl-8700k/igt@gem_tiled_pread_basic.html

  * igt@i915_pciid:
    - bat-arls-5:         [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-5/igt@i915_pciid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-5/igt@i915_pciid.html
    - bat-rplp-1:         [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rplp-1/igt@i915_pciid.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rplp-1/igt@i915_pciid.html
    - fi-rkl-11600:       [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-rkl-11600/igt@i915_pciid.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-rkl-11600/igt@i915_pciid.html
    - fi-cfl-guc:         [PASS][33] -> [FAIL][34] +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-cfl-guc/igt@i915_pciid.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-cfl-guc/igt@i915_pciid.html
    - bat-mtlp-6:         [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-6/igt@i915_pciid.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-6/igt@i915_pciid.html
    - bat-dg2-9:          [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-9/igt@i915_pciid.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-9/igt@i915_pciid.html
    - bat-adlp-11:        [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-11/igt@i915_pciid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-11/igt@i915_pciid.html
    - bat-mtlp-8:         [PASS][41] -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-8/igt@i915_pciid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-8/igt@i915_pciid.html
    - bat-dg2-8:          [PASS][43] -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-8/igt@i915_pciid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-8/igt@i915_pciid.html
    - bat-adls-6:         [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adls-6/igt@i915_pciid.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adls-6/igt@i915_pciid.html
    - bat-adlm-1:         [PASS][47] -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlm-1/igt@i915_pciid.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlm-1/igt@i915_pciid.html
    - bat-jsl-1:          [PASS][49] -> [FAIL][50] +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-jsl-1/igt@i915_pciid.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-jsl-1/igt@i915_pciid.html
    - bat-arls-1:         [PASS][51] -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@i915_pciid.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@i915_pciid.html
    - bat-adlp-6:         [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-6/igt@i915_pciid.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-6/igt@i915_pciid.html
    - bat-dg1-7:          [PASS][55] -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg1-7/igt@i915_pciid.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg1-7/igt@i915_pciid.html
    - bat-adlp-9:         [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-9/igt@i915_pciid.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-9/igt@i915_pciid.html
    - bat-twl-2:          [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-2/igt@i915_pciid.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-2/igt@i915_pciid.html
    - bat-rpls-4:         [PASS][61] -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rpls-4/igt@i915_pciid.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rpls-4/igt@i915_pciid.html
    - bat-twl-1:          [PASS][63] -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-1/igt@i915_pciid.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-1/igt@i915_pciid.html
    - bat-dg2-14:         [PASS][65] -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-14/igt@i915_pciid.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-14/igt@i915_pciid.html

  
#### Warnings ####

  * igt@gem_tiled_pread_basic:
    - bat-arls-5:         [SKIP][67] ([i915#10206] / [i915#4079]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-5/igt@gem_tiled_pread_basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-5/igt@gem_tiled_pread_basic.html
    - bat-adlp-6:         [SKIP][69] ([i915#3282]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-6/igt@gem_tiled_pread_basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-6/igt@gem_tiled_pread_basic.html
    - fi-rkl-11600:       [SKIP][71] ([i915#3282]) -> [FAIL][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-rkl-11600/igt@gem_tiled_pread_basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-rkl-11600/igt@gem_tiled_pread_basic.html
    - bat-dg1-7:          [SKIP][73] ([i915#4079]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg1-7/igt@gem_tiled_pread_basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg1-7/igt@gem_tiled_pread_basic.html
    - bat-adlp-9:         [SKIP][75] ([i915#3282]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-9/igt@gem_tiled_pread_basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-9/igt@gem_tiled_pread_basic.html
    - bat-twl-2:          [SKIP][77] ([i915#11031]) -> [FAIL][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-2/igt@gem_tiled_pread_basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-2/igt@gem_tiled_pread_basic.html
    - bat-rpls-4:         [SKIP][79] ([i915#3282]) -> [FAIL][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rpls-4/igt@gem_tiled_pread_basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rpls-4/igt@gem_tiled_pread_basic.html
    - bat-twl-1:          [SKIP][81] ([i915#11031]) -> [FAIL][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-1/igt@gem_tiled_pread_basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-1/igt@gem_tiled_pread_basic.html
    - bat-dg2-14:         [SKIP][83] ([i915#4079]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-14/igt@gem_tiled_pread_basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-14/igt@gem_tiled_pread_basic.html
    - bat-dg2-8:          [SKIP][85] ([i915#4079]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-8/igt@gem_tiled_pread_basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-8/igt@gem_tiled_pread_basic.html
    - bat-adlm-1:         [SKIP][87] ([i915#3282]) -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlm-1/igt@gem_tiled_pread_basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlm-1/igt@gem_tiled_pread_basic.html
    - bat-rplp-1:         [SKIP][89] ([i915#3282]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rplp-1/igt@gem_tiled_pread_basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rplp-1/igt@gem_tiled_pread_basic.html
    - bat-arls-1:         [SKIP][91] ([i915#10206] / [i915#4079]) -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@gem_tiled_pread_basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@gem_tiled_pread_basic.html
    - bat-mtlp-6:         [SKIP][93] ([i915#4079]) -> [FAIL][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-6/igt@gem_tiled_pread_basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-6/igt@gem_tiled_pread_basic.html
    - bat-dg2-9:          [SKIP][95] ([i915#4079]) -> [FAIL][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-9/igt@gem_tiled_pread_basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-9/igt@gem_tiled_pread_basic.html
    - bat-adlp-11:        [SKIP][97] ([i915#3282]) -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-11/igt@gem_tiled_pread_basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-11/igt@gem_tiled_pread_basic.html
    - bat-mtlp-8:         [SKIP][99] ([i915#4079]) -> [FAIL][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-8/igt@gem_tiled_pread_basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-8/igt@gem_tiled_pread_basic.html
    - bat-adls-6:         [SKIP][101] ([i915#3282]) -> [FAIL][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adls-6/igt@gem_tiled_pread_basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adls-6/igt@gem_tiled_pread_basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_tiled_pread_basic:
    - {bat-arlh-3}:       NOTRUN -> [FAIL][103] +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arlh-3/igt@gem_tiled_pread_basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_11650 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][104] -> [ABORT][105] ([i915#12062])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - bat-arls-1:         [FAIL][106] ([i915#12030]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@fbdev@write.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@fbdev@write.html

  * igt@i915_module_load@reload:
    - bat-apl-1:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@i915_module_load@reload.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [DMESG-WARN][110] ([i915#11621]) -> [PASS][111] +78 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@i915_selftest@live@requests.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@flip:
    - bat-apl-1:          [DMESG-WARN][112] ([i915#180] / [i915#1982]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@kms_busy@basic@flip.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - bat-apl-1:          [DMESG-WARN][114] ([i915#11621] / [i915#180]) -> [PASS][115] +33 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - bat-apl-1:          [DMESG-WARN][116] ([i915#11621] / [i915#180] / [i915#1982]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  
#### Warnings ####

  * igt@fbdev@read:
    - bat-arls-1:         [FAIL][118] ([i915#12030]) -> [DMESG-WARN][119] ([i915#9157])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@fbdev@read.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@fbdev@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
  [i915#11031]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11031
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#12030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12030
  [i915#12062]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12062
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7993 -> IGTPW_11650

  CI-20190529: 20190529
  CI_DRM_15307: 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11650: 11650
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/index.html

--===============5374541106299598069==
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
<tr><td><b>Series:</b></td><td>runner/executor.c: Detect tests killed by a signal</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137879/">https://patchwork.freedesktop.org/series/137879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15307 -&gt; IGTPW_11650</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11650 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11650, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (1): bat-arlh-3 <br />
  Missing    (4): fi-kbl-7567u bat-arlh-2 fi-snb-2520m fi-kbl-8809g </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11650:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-kbl-2/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-kbl-2/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-pnv-d510/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-pnv-d510/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-glk-j4005/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-glk-j4005/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-kbl-x1275/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-kbl-x1275/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-cfl-8109u/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-cfl-8109u/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-ivb-3770/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-ivb-3770/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-elk-e7500/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-elk-e7500/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-kbl-guc/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-kbl-guc/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-ilk-650/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-ilk-650/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-tgl-1115g4/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-tgl-1115g4/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-bsw-n3050/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-bsw-n3050/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-cfl-8700k/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-cfl-8700k/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pciid:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-5/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-5/igt@i915_pciid.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rplp-1/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rplp-1/igt@i915_pciid.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-rkl-11600/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-rkl-11600/igt@i915_pciid.html">FAIL</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-cfl-guc/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-cfl-guc/igt@i915_pciid.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-6/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-6/igt@i915_pciid.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-9/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-9/igt@i915_pciid.html">FAIL</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-11/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-11/igt@i915_pciid.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-8/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-8/igt@i915_pciid.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-8/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-8/igt@i915_pciid.html">FAIL</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adls-6/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adls-6/igt@i915_pciid.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlm-1/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlm-1/igt@i915_pciid.html">FAIL</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-jsl-1/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-jsl-1/igt@i915_pciid.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@i915_pciid.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-6/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-6/igt@i915_pciid.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg1-7/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg1-7/igt@i915_pciid.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-9/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-9/igt@i915_pciid.html">FAIL</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-2/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-2/igt@i915_pciid.html">FAIL</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rpls-4/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rpls-4/igt@i915_pciid.html">FAIL</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-1/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-1/igt@i915_pciid.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-14/igt@i915_pciid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-14/igt@i915_pciid.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_tiled_pread_basic:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-5/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-6/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/fi-rkl-11600/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg1-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg1-7/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-9/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-9/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11031">i915#11031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-2/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rpls-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rpls-4/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-twl-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11031">i915#11031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-twl-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-14/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-14/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-8/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlm-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-rplp-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-rplp-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-6/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-dg2-9/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-dg2-9/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adlp-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adlp-11/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-8/igt@gem_tiled_pread_basic.html">FAIL</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-adls-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-adls-6/igt@gem_tiled_pread_basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_tiled_pread_basic:<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arlh-3/igt@gem_tiled_pread_basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11650 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12062">i915#12062</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@fbdev@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12030">i915#12030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@i915_module_load@reload.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@i915_selftest@live@requests.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@fbdev@read:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15307/bat-arls-1/igt@fbdev@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12030">i915#12030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11650/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157">i915#9157</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7993 -&gt; IGTPW_11650</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15307: 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11650: 11650<br />
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5374541106299598069==--
