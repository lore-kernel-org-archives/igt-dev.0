Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C935C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 06:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A1B10E481;
	Fri, 14 Feb 2025 06:48:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEEF10E47F;
 Fri, 14 Feb 2025 06:48:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7056973694009653106=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_add_dsc-fallback_test_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Feb 2025 06:48:05 -0000
Message-ID: <173951568543.1944256.8363247114875298273@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

--===============7056973694009653106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add dsc-fallback test (rev4)
URL   : https://patchwork.freedesktop.org/series/143877/
State : success

== Summary ==

CI Bug Log - changes from IGT_8228 -> IGTPW_12576
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): fi-hsw-4770 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8228 and IGTPW_12576:

### New IGT tests (2) ###

  * igt@kms_dp_linktrain_fallback@dp-fallbck:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - Statuses : 2 pass(s) 38 skip(s)
    - Exec time: [0.0, 1.40] s

  

Known issues
------------

  Here are the changes found in IGTPW_12576 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dp_linktrain_fallback@dp-fallbck (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][1] ([i915#6078]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-atsm-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][2] ([i915#13686])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-arls-6:         NOTRUN -> [SKIP][3] ([i915#13686])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-ivb-3770/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg2-8:          NOTRUN -> [SKIP][5] ([i915#13686])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-guc/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#13686])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adls-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-jsl-1:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-arlh-3:         NOTRUN -> [SKIP][9] ([i915#13686])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg1-7:          NOTRUN -> [SKIP][10] ([i915#13686])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg1-7/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-adlp-9:         NOTRUN -> [SKIP][11] ([i915#13686])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-rpls-4:         NOTRUN -> [SKIP][12] ([i915#13686])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rpls-4/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-twl-1:          NOTRUN -> [SKIP][13] ([i915#13686])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-arls-5:         NOTRUN -> [SKIP][14] ([i915#13686])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-5/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-rplp-1:         NOTRUN -> [SKIP][15] ([i915#13686])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#13686])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17] ([i915#13686])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#13686])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg2-9:          NOTRUN -> [SKIP][19] ([i915#13686])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-adlp-6:         NOTRUN -> [SKIP][20] ([i915#13686])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-jsl-3:          NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-twl-2:          NOTRUN -> [SKIP][22] ([i915#13686])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg2-11:         NOTRUN -> [SKIP][23] ([i915#13686])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg2-14:         NOTRUN -> [SKIP][24] ([i915#13686])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-14/igt@kms_dp_linktrain_fallback@dp-fallbck.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][25] ([i915#13685])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adls-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][26] ([i915#13685])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][27] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-bsw-n3050/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][28] ([i915#11346]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][29] ([i915#13685])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arlh-3:         NOTRUN -> [SKIP][30] ([i915#13685])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][31] ([i915#13685])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg1-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][32] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-glk-j4005/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-adlp-9:         NOTRUN -> [SKIP][33] ([i915#13685])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-rpls-4:         NOTRUN -> [SKIP][34] ([i915#13685])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rpls-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][35] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-7567u/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][36] ([i915#13685])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][37] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-apl-1:          NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-apl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arls-5:         NOTRUN -> [SKIP][39] ([i915#13685])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][40] ([i915#13685])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rplp-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][41] ([i915#13685])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][42] +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][43] ([i915#9792])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][44] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][45] ([i915#10470]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-11/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][46] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-8109u/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg1-6:          NOTRUN -> [SKIP][47] ([i915#12311]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg1-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][48] +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-ilk-650/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][49] +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-kbl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-adlp-6:         NOTRUN -> [SKIP][50] ([i915#13685])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-jsl-3:          NOTRUN -> [SKIP][51] ([i915#13685])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][52] ([i915#13685])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][53] ([i915#13685])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-11/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][54] +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-8700k/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg2-14:         NOTRUN -> [SKIP][55] ([i915#13685])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][56] +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-elk-e7500/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][57] +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-bsw-nick/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][58] ([i915#13685])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arls-6:         NOTRUN -> [SKIP][59] ([i915#13685])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][60] -> [DMESG-WARN][61] ([i915#11621]) +47 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][62] ([i915#12061]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685
  [i915#13686]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8228 -> IGTPW_12576
  * Linux: CI_DRM_16103 -> CI_DRM_16110

  CI-20190529: 20190529
  CI_DRM_16103: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16110: e1c145994c41ed6dd5265bc0a7a276fe1834f3ee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12576: 12576
  IGT_8228: 8228

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/index.html

--===============7056973694009653106==
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
<tr><td><b>Series:</b></td><td>add dsc-fallback test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143877/">https://patchwork.freedesktop.org/series/143877/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8228 -&gt; IGTPW_12576</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8228 and IGTPW_12576:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallbck:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>Statuses : 2 pass(s) 38 skip(s)</li>
<li>Exec time: [0.0, 1.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12576 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallbck (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-atsm-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +1 other test skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-ivb-3770/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-guc/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adls-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a></li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-3/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg1-7/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rpls-4/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-5/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rplp-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-3/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-2/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-14/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13686">i915#13686</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adls-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-bsw-n3050/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-rkl-11600/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg1-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-glk-j4005/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rpls-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-7567u/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-apl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-rplp-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-11/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-8109u/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg1-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-ilk-650/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-kbl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-jsl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-twl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-11/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-8700k/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-dg2-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-elk-e7500/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-bsw-nick/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arls-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13685">i915#13685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +47 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8228 -&gt; IGTPW_12576</li>
<li>Linux: CI_DRM_16103 -&gt; CI_DRM_16110</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16103: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16110: e1c145994c41ed6dd5265bc0a7a276fe1834f3ee @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12576: 12576<br />
  IGT_8228: 8228</p>

</body>
</html>

--===============7056973694009653106==--
