Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26450C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 07:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16410E00F;
	Wed, 26 Mar 2025 07:48:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680310E00F;
 Wed, 26 Mar 2025 07:48:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3852618302301565927=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Fix_VRR_multi_display_iss?=
 =?utf-8?q?ue_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Mar 2025 07:48:18 -0000
Message-ID: <174297529861.4252.16964577821181232093@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325200209.3329037-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250325200209.3329037-1-ramanaidu.naladala@intel.com>
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

--===============3852618302301565927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix VRR multi display issue (rev2)
URL   : https://patchwork.freedesktop.org/series/146070/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8285 -> IGTPW_12837
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12837 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12837, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/index.html

Participating hosts (40 -> 40)
------------------------------

  Additional (1): bat-arlh-2 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12837:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic-fastset:
    - bat-mtlp-8:         NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic@pipe-a-edp-1:
    - bat-twl-1:          NOTRUN -> [FAIL][2] +7 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-twl-1/igt@kms_vrr@flip-basic@pipe-a-edp-1.html

  * igt@kms_vrr@flipline@pipe-a-dp-1 (NEW):
    - bat-adlp-9:         NOTRUN -> [FAIL][3] +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-9/igt@kms_vrr@flipline@pipe-a-dp-1.html

  * igt@kms_vrr@max-min:
    - bat-adls-6:         NOTRUN -> [FAIL][4] +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adls-6/igt@kms_vrr@max-min.html
    - bat-rpls-4:         NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-rpls-4/igt@kms_vrr@max-min.html

  
New tests
---------

  New tests have been introduced between IGT_8285 and IGTPW_12837:

### New IGT tests (5) ###

  * igt@kms_vrr@flip-basic@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [10.44, 10.56] s

  * igt@kms_vrr@flip-dpms@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [10.62, 10.78] s

  * igt@kms_vrr@flip-suspend@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [11.62, 11.90] s

  * igt@kms_vrr@flipline@pipe-a-dp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [5.42, 20.56] s

  * igt@kms_vrr@max-min@pipe-a-dp-1:
    - Statuses : 3 fail(s)
    - Exec time: [5.38, 5.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_12837 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([i915#3555]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-rkl-11600/igt@kms_vrr@flip-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-cfl-guc/igt@kms_vrr@flip-basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#8808]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-9/igt@kms_vrr@flip-basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][9] ([i915#3555]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-9/igt@kms_vrr@flip-basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][10] +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-x1275/igt@kms_vrr@flip-basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][11] ([i915#10470] / [i915#10501]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-11/igt@kms_vrr@flip-basic.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][12] +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-hsw-4770/igt@kms_vrr@flip-basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][13] +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-cfl-8109u/igt@kms_vrr@flip-basic.html
    - bat-dg1-6:          NOTRUN -> [SKIP][14] ([i915#12311]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg1-6/igt@kms_vrr@flip-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][15] +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-guc/igt@kms_vrr@flip-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16] ([i915#3555]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][17] +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-skl-6600u/igt@kms_vrr@flip-basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][18] ([i915#8808]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - bat-arlh-3:         NOTRUN -> [SKIP][19] ([i915#11507]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arlh-3/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg1-7:          NOTRUN -> [SKIP][20] ([i915#9906]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html
    - bat-twl-2:          NOTRUN -> [SKIP][21] ([i915#11507] / [i915#9906]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-twl-2/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-11:         NOTRUN -> [SKIP][22] ([i915#9906]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][23] +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-8809g/igt@kms_vrr@flip-basic-fastset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][24] +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-ivb-3770/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-14:         NOTRUN -> [SKIP][25] ([i915#9906]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-14/igt@kms_vrr@flip-basic-fastset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][26] +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html
    - bat-arls-5:         NOTRUN -> [SKIP][27] ([i915#11507] / [i915#8808] / [i915#9906]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-5/igt@kms_vrr@flip-basic-fastset.html
    - bat-adlp-11:        NOTRUN -> [SKIP][28] ([i915#10470])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-11/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - bat-dg1-7:          NOTRUN -> [SKIP][29] ([i915#3555]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg1-7/igt@kms_vrr@flip-dpms.html
    - bat-twl-2:          NOTRUN -> [SKIP][30] ([i915#11507]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-twl-2/igt@kms_vrr@flip-dpms.html
    - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#3555]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-11/igt@kms_vrr@flip-dpms.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][32] +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][33] +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-cfl-8700k/igt@kms_vrr@flipline.html
    - bat-apl-1:          NOTRUN -> [SKIP][34] +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-apl-1/igt@kms_vrr@flipline.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][35] +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-blb-e6850/igt@kms_vrr@flipline.html
    - bat-dg2-14:         NOTRUN -> [SKIP][36] ([i915#3555]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-14/igt@kms_vrr@flipline.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][37] +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-bsw-nick/igt@kms_vrr@flipline.html
    - bat-kbl-2:          NOTRUN -> [SKIP][38] +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-kbl-2/igt@kms_vrr@flipline.html
    - bat-arls-5:         NOTRUN -> [SKIP][39] ([i915#11507] / [i915#8808]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-5/igt@kms_vrr@flipline.html
    - bat-adlp-6:         NOTRUN -> [SKIP][40] ([i915#3555]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-6/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][41] ([i915#3555]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-rplp-1/igt@kms_vrr@flipline.html
    - bat-arlh-2:         NOTRUN -> [SKIP][42] ([i915#11346]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arlh-2/igt@kms_vrr@flipline.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][43] ([i915#12933] / [i915#12992])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-8/igt@kms_vrr@flipline.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - bat-mtlp-8:         NOTRUN -> [FAIL][44] ([i915#12933])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-8/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - bat-rplp-1:         NOTRUN -> [SKIP][45] ([i915#9906]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-rplp-1/igt@kms_vrr@max-min.html
    - fi-ilk-650:         NOTRUN -> [SKIP][46] +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-ilk-650/igt@kms_vrr@max-min.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][47] ([i915#9906]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-tgl-1115g4/igt@kms_vrr@max-min.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][48] +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-bsw-n3050/igt@kms_vrr@max-min.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][49] ([i915#9792]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-6/igt@kms_vrr@max-min.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][50] ([i915#8808] / [i915#9906]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-9/igt@kms_vrr@max-min.html
    - bat-arls-6:         NOTRUN -> [SKIP][51] ([i915#8808] / [i915#9906]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-6/igt@kms_vrr@max-min.html
    - bat-dg2-9:          NOTRUN -> [SKIP][52] ([i915#9906]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-9/igt@kms_vrr@max-min.html
    - bat-adlp-6:         NOTRUN -> [SKIP][53] ([i915#9906]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-6/igt@kms_vrr@max-min.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][54] ([i915#9906]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-rkl-11600/igt@kms_vrr@max-min.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11507
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12933]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12933
  [i915#12992]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12992
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8285 -> IGTPW_12837

  CI-20190529: 20190529
  CI_DRM_16321: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12837: 12837
  IGT_8285: 8285

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/index.html

--===============3852618302301565927==
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
<tr><td><b>Series:</b></td><td>Fix VRR multi display issue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146070/">https://patchwork.freedesktop.org/series/146070/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8285 -&gt; IGTPW_12837</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12837 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12837, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/index.html</p>
<h2>Participating hosts (40 -&gt; 40)</h2>
<p>Additional (1): bat-arlh-2 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12837:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic@pipe-a-edp-1:</p>
<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-twl-1/igt@kms_vrr@flip-basic@pipe-a-edp-1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-dp-1 (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-9/igt@kms_vrr@flipline@pipe-a-dp-1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adls-6/igt@kms_vrr@max-min.html">FAIL</a> +3 other tests fail</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-rpls-4/igt@kms_vrr@max-min.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8285 and IGTPW_12837:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_vrr@flip-basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.44, 10.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.62, 10.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.62, 11.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [5.42, 20.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [5.38, 5.47] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12837 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-x1275/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-11/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +4 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-hsw-4770/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-cfl-8109u/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg1-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +5 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-skl-6600u/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arlh-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11507">i915#11507</a>) +5 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-twl-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11507">i915#11507</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-8809g/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-ivb-3770/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-14/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11507">i915#11507</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-11/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg1-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-twl-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11507">i915#11507</a>) +3 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-11/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-cfl-8700k/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-apl-1/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-blb-e6850/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-14/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-bsw-nick/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-kbl-2/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11507">i915#11507</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arlh-2/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +5 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-8/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12933">i915#12933</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12992">i915#12992</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-8/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12933">i915#12933</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-rplp-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-ilk-650/igt@kms_vrr@max-min.html">SKIP</a> +5 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-tgl-1115g4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-bsw-n3050/igt@kms_vrr@max-min.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +5 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-mtlp-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-arls-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-dg2-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/bat-adlp-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12837/fi-rkl-11600/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8285 -&gt; IGTPW_12837</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16321: 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12837: 12837<br />
  IGT_8285: 8285</p>

</body>
</html>

--===============3852618302301565927==--
