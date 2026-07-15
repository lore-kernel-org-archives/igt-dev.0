Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704CEC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3BF10EFA4;
	Wed, 15 Jul 2026 10:39:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AAF10EFA4;
 Wed, 15 Jul 2026 10:38:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2925899244160963695=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_CI=3A_Update_NVL=2C_LNL_a?=
 =?utf-8?q?nd_BMG_Core_Blocklist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jul 2026 10:38:37 -0000
Message-ID: <178411191716.190771.8147498207831266132@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
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

--===============2925899244160963695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CI: Update NVL, LNL and BMG Core Blocklist
URL   : https://patchwork.freedesktop.org/series/170462/
State : success

== Summary ==

CI Bug Log - changes from IGT_9006 -> IGTPW_15533
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-dg2-13 bat-mtlp-9 fi-snb-2520m fi-elk-e7500 

Known issues
------------

  Here are the changes found in IGTPW_15533 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-ilk-650:         [PASS][1] -> [ABORT][2] ([i915#16623])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-ilk-650/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-ilk-650/igt@i915_module_load@load.html
    - fi-bsw-n3050:       [PASS][3] -> [ABORT][4] ([i915#16623])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-bsw-n3050/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-bsw-n3050/igt@i915_module_load@load.html
    - bat-adlp-6:         [PASS][5] -> [ABORT][6] ([i915#16623])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adlp-6/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adlp-6/igt@i915_module_load@load.html
    - bat-arlh-2:         [PASS][7] -> [ABORT][8] ([i915#16623])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arlh-2/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arlh-2/igt@i915_module_load@load.html
    - fi-rkl-11600:       [PASS][9] -> [ABORT][10] ([i915#16623])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-rkl-11600/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-rkl-11600/igt@i915_module_load@load.html
    - fi-skl-6600u:       [PASS][11] -> [ABORT][12] ([i915#16623])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-skl-6600u/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-skl-6600u/igt@i915_module_load@load.html
    - bat-arlh-3:         [PASS][13] -> [ABORT][14] ([i915#16623])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arlh-3/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arlh-3/igt@i915_module_load@load.html
    - fi-pnv-d510:        [PASS][15] -> [ABORT][16] ([i915#16623])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-pnv-d510/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-pnv-d510/igt@i915_module_load@load.html
    - bat-dg1-7:          [PASS][17] -> [ABORT][18] ([i915#16623])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg1-7/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg1-7/igt@i915_module_load@load.html
    - fi-glk-j4005:       [PASS][19] -> [ABORT][20] ([i915#16623])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-glk-j4005/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-glk-j4005/igt@i915_module_load@load.html
    - bat-adlp-9:         [PASS][21] -> [ABORT][22] ([i915#16623])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adlp-9/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adlp-9/igt@i915_module_load@load.html
    - bat-twl-2:          [PASS][23] -> [ABORT][24] ([i915#16623])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-twl-2/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-twl-2/igt@i915_module_load@load.html
    - bat-rpls-4:         [PASS][25] -> [ABORT][26] ([i915#16623])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-rpls-4/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-rpls-4/igt@i915_module_load@load.html
    - fi-kbl-7567u:       [PASS][27] -> [ABORT][28] ([i915#16623])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-kbl-7567u/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-kbl-7567u/igt@i915_module_load@load.html
    - fi-cfl-8700k:       [PASS][29] -> [ABORT][30] ([i915#16623])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-cfl-8700k/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-cfl-8700k/igt@i915_module_load@load.html
    - bat-twl-1:          [PASS][31] -> [ABORT][32] ([i915#16623])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-twl-1/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-twl-1/igt@i915_module_load@load.html
    - fi-kbl-8809g:       [PASS][33] -> [ABORT][34] ([i915#16623])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-kbl-8809g/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-kbl-8809g/igt@i915_module_load@load.html
    - bat-jsl-5:          [PASS][35] -> [ABORT][36] ([i915#16623])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-jsl-5/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-jsl-5/igt@i915_module_load@load.html
    - bat-apl-1:          [PASS][37] -> [ABORT][38] ([i915#16623])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-apl-1/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-apl-1/igt@i915_module_load@load.html
    - bat-dg2-14:         [PASS][39] -> [ABORT][40] ([i915#16623])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg2-14/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg2-14/igt@i915_module_load@load.html
    - fi-bsw-nick:        [PASS][41] -> [ABORT][42] ([i915#16623])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-bsw-nick/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-bsw-nick/igt@i915_module_load@load.html
    - bat-kbl-2:          [PASS][43] -> [ABORT][44] ([i915#16623])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-kbl-2/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-kbl-2/igt@i915_module_load@load.html
    - bat-arls-5:         [PASS][45] -> [ABORT][46] ([i915#16623])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arls-5/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arls-5/igt@i915_module_load@load.html
    - bat-rplp-1:         [PASS][47] -> [ABORT][48] ([i915#16623])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-rplp-1/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-rplp-1/igt@i915_module_load@load.html
    - fi-tgl-1115g4:      [PASS][49] -> [ABORT][50] ([i915#16623])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-tgl-1115g4/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-tgl-1115g4/igt@i915_module_load@load.html
    - fi-cfl-guc:         [PASS][51] -> [ABORT][52] ([i915#16623])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-cfl-guc/igt@i915_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-cfl-guc/igt@i915_module_load@load.html
    - bat-arls-6:         [PASS][53] -> [ABORT][54] ([i915#16623])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arls-6/igt@i915_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arls-6/igt@i915_module_load@load.html
    - bat-dg2-9:          [PASS][55] -> [ABORT][56] ([i915#16623])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg2-9/igt@i915_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg2-9/igt@i915_module_load@load.html
    - fi-kbl-x1275:       [PASS][57] -> [ABORT][58] ([i915#16623])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-kbl-x1275/igt@i915_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-kbl-x1275/igt@i915_module_load@load.html
    - bat-adlp-11:        [PASS][59] -> [ABORT][60] ([i915#16623])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adlp-11/igt@i915_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adlp-11/igt@i915_module_load@load.html
    - fi-hsw-4770:        [PASS][61] -> [ABORT][62] ([i915#16623])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-hsw-4770/igt@i915_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-hsw-4770/igt@i915_module_load@load.html
    - fi-cfl-8109u:       [PASS][63] -> [ABORT][64] ([i915#16623])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-cfl-8109u/igt@i915_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-cfl-8109u/igt@i915_module_load@load.html
    - fi-ivb-3770:        [PASS][65] -> [ABORT][66] ([i915#16623])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-ivb-3770/igt@i915_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-ivb-3770/igt@i915_module_load@load.html
    - bat-mtlp-8:         [PASS][67] -> [ABORT][68] ([i915#16623])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-mtlp-8/igt@i915_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-mtlp-8/igt@i915_module_load@load.html
    - bat-dg1-6:          [PASS][69] -> [ABORT][70] ([i915#16623])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg1-6/igt@i915_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg1-6/igt@i915_module_load@load.html
    - bat-dg2-8:          [PASS][71] -> [ABORT][72] ([i915#16623])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg2-8/igt@i915_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg2-8/igt@i915_module_load@load.html
    - bat-adls-6:         [PASS][73] -> [ABORT][74] ([i915#16623])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adls-6/igt@i915_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adls-6/igt@i915_module_load@load.html

  
  [i915#16623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9006 -> IGTPW_15533
  * Linux: CI_DRM_18816 -> CI_DRM_18827

  CI-20190529: 20190529
  CI_DRM_18816: 4df02bb6acd1307de4de001699112cbdaf5afdfc @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18827: 6dd678fdc2f39062bed466d7e3c851736e376531 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15533: 27ba2b269e79d47d88caa30d9492ced927173752 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/index.html

--===============2925899244160963695==
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
<tr><td><b>Series:</b></td><td>CI: Update NVL, LNL and BMG Core Blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170462/">https://patchwork.freedesktop.org/series/170462/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9006 -&gt; IGTPW_15533</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-dg2-13 bat-mtlp-9 fi-snb-2520m fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15533 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-ilk-650/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-ilk-650/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-bsw-n3050/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-bsw-n3050/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adlp-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adlp-6/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arlh-2/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arlh-2/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-rkl-11600/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-rkl-11600/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-skl-6600u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-skl-6600u/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arlh-3/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arlh-3/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-pnv-d510/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-pnv-d510/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg1-7/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg1-7/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-glk-j4005/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-glk-j4005/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adlp-9/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-twl-2/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-twl-2/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-rpls-4/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-rpls-4/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-kbl-7567u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-kbl-7567u/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-cfl-8700k/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-cfl-8700k/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-twl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-twl-1/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-kbl-8809g/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-kbl-8809g/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-jsl-5/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-jsl-5/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-apl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-apl-1/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg2-14/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg2-14/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-bsw-nick/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-bsw-nick/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-kbl-2/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-kbl-2/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arls-5/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arls-5/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-rplp-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-rplp-1/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-tgl-1115g4/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-tgl-1115g4/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-cfl-guc/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-cfl-guc/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-arls-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-arls-6/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg2-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg2-9/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-kbl-x1275/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-kbl-x1275/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-hsw-4770/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-hsw-4770/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-cfl-8109u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-cfl-8109u/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/fi-ivb-3770/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/fi-ivb-3770/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-mtlp-8/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-mtlp-8/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg1-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg1-6/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-dg2-8/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-dg2-8/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9006/bat-adls-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15533/bat-adls-6/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16623">i915#16623</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9006 -&gt; IGTPW_15533</li>
<li>Linux: CI_DRM_18816 -&gt; CI_DRM_18827</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18816: 4df02bb6acd1307de4de001699112cbdaf5afdfc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18827: 6dd678fdc2f39062bed466d7e3c851736e376531 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15533: 27ba2b269e79d47d88caa30d9492ced927173752 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2925899244160963695==--
