Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D0BCCF9E2
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 00:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE910E1C5;
	Thu, 23 Oct 2025 00:06:04 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011EF10E1C5;
 Thu, 23 Oct 2025 00:06:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1456705818762560434=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_LRR_test_to_start_above_m?=
 =?utf-8?q?idpoint_for_multi-mode_panels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Oct 2025 00:06:03 -0000
Message-ID: <176117796398.44198.12505257101737306158@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
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

--===============1456705818762560434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: LRR test to start above midpoint for multi-mode panels
URL   : https://patchwork.freedesktop.org/series/156373/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8595 -> IGTPW_13930
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13930 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13930, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13930:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@cmrr:
    - bat-dg1-7:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@cmrr.html
    - bat-dg2-9:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@cmrr.html
    - bat-dg2-11:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@cmrr.html
    - bat-rpls-4:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@cmrr.html
    - bat-twl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@cmrr.html
    - bat-dg2-14:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@cmrr.html
    - bat-dg2-8:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@cmrr.html
    - bat-rplp-1:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@cmrr.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@cmrr.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@cmrr.html
    - bat-arls-6:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@cmrr.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@cmrr.html
    - bat-adlp-9:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@cmrr.html
    - bat-adls-6:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@cmrr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@cmrr.html
    - bat-arls-5:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@cmrr.html
    - bat-adlp-6:         NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] +11 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-rkl-11600/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - bat-twl-1:          NOTRUN -> [FAIL][19] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@flip-basic-fastset.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][20] +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - bat-twl-2:          NOTRUN -> [SKIP][21] +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - bat-arlh-3:         NOTRUN -> [SKIP][22] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - bat-adlp-6:         NOTRUN -> [FAIL][23] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - bat-adlp-11:        NOTRUN -> [SKIP][24] +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html

  
Known issues
------------

  Here are the changes found in IGTPW_13930 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@cmrr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][25] +11 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-pnv-d510/igt@kms_vrr@cmrr.html
    - bat-atsm-1:         NOTRUN -> [SKIP][26] ([i915#6078]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-atsm-1/igt@kms_vrr@cmrr.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][27] +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-8809g/igt@kms_vrr@cmrr.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][28] +11 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-elk-e7500/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - fi-cfl-guc:         NOTRUN -> [SKIP][29] +11 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-cfl-guc/igt@kms_vrr@flip-basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][30] ([i915#3555] / [i915#8808]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@flip-basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][31] ([i915#3555]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@flip-basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][32] ([i915#3555]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@flip-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][33] ([i915#3555]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@flip-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][34] ([i915#3555]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@flip-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][35] ([i915#3555]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][36] ([i915#8808]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - bat-arlh-3:         NOTRUN -> [SKIP][37] ([i915#9906]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-3/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg1-7:          NOTRUN -> [SKIP][38] ([i915#9906]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html
    - bat-twl-2:          NOTRUN -> [SKIP][39] ([i915#9906]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-2/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-11:         NOTRUN -> [SKIP][40] ([i915#9906]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - bat-dg1-7:          NOTRUN -> [SKIP][41] ([i915#3555]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@flip-dpms.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][42] +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-glk-j4005/igt@kms_vrr@flip-dpms.html
    - bat-dg2-11:         NOTRUN -> [SKIP][43] ([i915#3555]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@flip-dpms.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][44] +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - bat-dg2-14:         NOTRUN -> [SKIP][45] ([i915#3555]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@flipline.html
    - bat-arls-5:         NOTRUN -> [SKIP][46] ([i915#8808]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@flipline.html
    - bat-adlp-6:         NOTRUN -> [SKIP][47] ([i915#3555]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][48] ([i915#3555]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - bat-mtlp-8:         NOTRUN -> [FAIL][49] ([i915#12933]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][50] +11 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-bsw-n3050/igt@kms_vrr@lobf.html
    - bat-adlp-6:         NOTRUN -> [SKIP][51] ([i915#11920])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@lobf.html
    - bat-arlh-3:         NOTRUN -> [SKIP][52] ([i915#11920])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-3/igt@kms_vrr@lobf.html
    - bat-dg1-7:          NOTRUN -> [SKIP][53] ([i915#11920])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@lobf.html
    - bat-adlp-9:         NOTRUN -> [SKIP][54] ([i915#11920])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@lobf.html
    - bat-twl-2:          NOTRUN -> [SKIP][55] ([i915#11920])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-2/igt@kms_vrr@lobf.html
    - bat-dg2-11:         NOTRUN -> [SKIP][56] ([i915#11920])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@lobf.html
    - bat-rpls-4:         NOTRUN -> [SKIP][57] ([i915#11920])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@lobf.html
    - bat-twl-1:          NOTRUN -> [SKIP][58] ([i915#11920])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@lobf.html
    - bat-dg2-14:         NOTRUN -> [SKIP][59] ([i915#11920])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@lobf.html
    - bat-arls-5:         NOTRUN -> [SKIP][60] ([i915#11920])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@lobf.html
    - bat-rplp-1:         NOTRUN -> [SKIP][61] ([i915#11920])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@lobf.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][62] ([i915#11920])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@lobf.html
    - bat-arls-6:         NOTRUN -> [SKIP][63] ([i915#11920])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@lobf.html
    - bat-dg2-9:          NOTRUN -> [SKIP][64] ([i915#11920])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@lobf.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][65] ([i915#11920])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@lobf.html
    - bat-dg2-8:          NOTRUN -> [SKIP][66] ([i915#11920])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@lobf.html
    - bat-adls-6:         NOTRUN -> [SKIP][67] ([i915#11920])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@lobf.html
    - bat-jsl-1:          NOTRUN -> [SKIP][68] ([i915#11920])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@lobf.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][69] ([i915#11920])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - bat-rplp-1:         NOTRUN -> [SKIP][70] ([i915#9906]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@max-min.html
    - fi-ilk-650:         NOTRUN -> [SKIP][71] +11 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-ilk-650/igt@kms_vrr@max-min.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][72] ([i915#9906]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@max-min.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][73] ([i915#9792]) +11 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-6/igt@kms_vrr@max-min.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][74] ([i915#8808] / [i915#9906]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - bat-kbl-2:          NOTRUN -> [SKIP][75] +11 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-kbl-2/igt@kms_vrr@negative-basic.html
    - bat-arlh-2:         NOTRUN -> [SKIP][76] ([i915#11346]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-2/igt@kms_vrr@negative-basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][77] +11 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-skl-6600u/igt@kms_vrr@negative-basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][78] ([i915#3555] / [i915#9906])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@negative-basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][79] ([i915#3555] / [i915#9906])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@negative-basic.html
    - bat-rpls-4:         NOTRUN -> [SKIP][80] ([i915#3555] / [i915#9906])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@negative-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][81] ([i915#3555] / [i915#9906])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@negative-basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][82] ([i915#3555] / [i915#8808] / [i915#9906])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@negative-basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][83] ([i915#3555] / [i915#9906])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@negative-basic.html
    - bat-adls-6:         NOTRUN -> [SKIP][84] ([i915#3555] / [i915#9906])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][85] +11 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-twl-1:          NOTRUN -> [SKIP][86] ([i915#9906]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-apl-1:          NOTRUN -> [SKIP][87] +11 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-apl-1/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg2-14:         NOTRUN -> [SKIP][88] ([i915#9906]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-arls-5:         NOTRUN -> [SKIP][89] ([i915#8808] / [i915#9906]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-adlp-6:         NOTRUN -> [SKIP][90] ([i915#9906]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-rpls-4:         NOTRUN -> [SKIP][91] ([i915#9906]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][92] ([i915#8808] / [i915#9906]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - bat-arls-6:         NOTRUN -> [SKIP][93] ([i915#8808] / [i915#9906]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg2-9:          NOTRUN -> [SKIP][94] ([i915#9906]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][95] +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][96] +11 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-hsw-4770/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][97] +11 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][98] +11 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-ivb-3770/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg1-6:          NOTRUN -> [SKIP][99] ([i915#12311]) +11 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - bat-dg2-8:          NOTRUN -> [SKIP][100] ([i915#9906]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][101] +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - bat-adlp-9:         NOTRUN -> [SKIP][102] ([i915#9906]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adls-6:         NOTRUN -> [SKIP][103] ([i915#9906]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][104] ([i915#9906]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12933]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12933
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8595 -> IGTPW_13930

  CI-20190529: 20190529
  CI_DRM_17410: 71929a54e8bb5da291d41a931d80c6c9160073dd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13930: 13930
  IGT_8595: 8595

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/index.html

--===============1456705818762560434==
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
<tr><td><b>Series:</b></td><td>LRR test to start above midpoint for multi-mode panels</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156373/">https://patchwork.freedesktop.org/series/156373/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8595 -&gt; IGTPW_13930</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13930 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13930, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13930:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@cmrr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-2/igt@kms_vrr@flip-dpms.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-3/igt@kms_vrr@flip-suspend.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@negative-basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13930 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-pnv-d510/igt@kms_vrr@cmrr.html">SKIP</a> +11 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-atsm-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +11 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-8809g/igt@kms_vrr@cmrr.html">SKIP</a> +11 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-elk-e7500/igt@kms_vrr@cmrr.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +11 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-glk-j4005/igt@kms_vrr@flip-dpms.html">SKIP</a> +11 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12933">i915#12933</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-bsw-n3050/igt@kms_vrr@lobf.html">SKIP</a> +11 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rplp-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-ilk-650/igt@kms_vrr@max-min.html">SKIP</a> +11 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +11 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-kbl-2/igt@kms_vrr@negative-basic.html">SKIP</a> +11 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arlh-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +11 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-skl-6600u/igt@kms_vrr@negative-basic.html">SKIP</a> +11 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-11/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-tgl-1115g4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +11 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-twl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-apl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +11 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-arls-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +5 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +11 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-hsw-4770/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +11 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +11 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-ivb-3770/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +11 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg1-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +11 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13930/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8595 -&gt; IGTPW_13930</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17410: 71929a54e8bb5da291d41a931d80c6c9160073dd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13930: 13930<br />
  IGT_8595: 8595</p>

</body>
</html>

--===============1456705818762560434==--
