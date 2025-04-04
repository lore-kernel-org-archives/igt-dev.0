Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D55C3601A
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 05:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F12410E2EF;
	Fri,  4 Apr 2025 05:37:08 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD7F10E276;
 Fri,  4 Apr 2025 05:37:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4368486968232053962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Bucketize_refresh_rate_to?=
 =?utf-8?q?lerance_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 04 Apr 2025 05:37:06 -0000
Message-ID: <174374502677.37441.334948675371234901@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============4368486968232053962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Bucketize refresh rate tolerance (rev3)
URL   : https://patchwork.freedesktop.org/series/146850/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8304 -> IGTPW_12922
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12922 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12922, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/index.html

Participating hosts (43 -> 42)
------------------------------

  Additional (1): bat-arlh-2 
  Missing    (2): bat-adlp-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12922:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic-fastset:
    - bat-arlh-3:         NOTRUN -> [SKIP][1] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arlh-3/igt@kms_vrr@flip-basic-fastset.html
    - bat-twl-1:          NOTRUN -> [FAIL][2] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-twl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - bat-twl-2:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-twl-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - bat-adls-6:         NOTRUN -> [FAIL][4] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-adls-6/igt@kms_vrr@max-min.html

  
New tests
---------

  New tests have been introduced between IGT_8304 and IGTPW_12922:

### New IGT tests (5) ###

  * igt@kms_vrr@flip-basic@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [10.42, 10.60] s

  * igt@kms_vrr@flip-dpms@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [10.62, 10.79] s

  * igt@kms_vrr@flip-suspend@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [11.51, 11.99] s

  * igt@kms_vrr@flipline@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [20.47, 20.67] s

  * igt@kms_vrr@max-min@pipe-a-dp-1:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [5.38, 5.49] s

  

Known issues
------------

  Here are the changes found in IGTPW_12922 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([i915#3555]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-rkl-11600/igt@kms_vrr@flip-basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#6078]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-atsm-1/igt@kms_vrr@flip-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-cfl-guc/igt@kms_vrr@flip-basic.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#8808]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-mtlp-9/igt@kms_vrr@flip-basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][9] ([i915#3555]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-9/igt@kms_vrr@flip-basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][10] +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-x1275/igt@kms_vrr@flip-basic.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][11] +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-hsw-4770/igt@kms_vrr@flip-basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][12] +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-cfl-8109u/igt@kms_vrr@flip-basic.html
    - bat-dg1-6:          NOTRUN -> [SKIP][13] ([i915#12311]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg1-6/igt@kms_vrr@flip-basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][14] ([i915#3555]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-8/igt@kms_vrr@flip-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][15] +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-guc/igt@kms_vrr@flip-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16] ([i915#3555]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html
    - bat-arls-6:         NOTRUN -> [SKIP][17] ([i915#8808]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - bat-dg1-7:          NOTRUN -> [SKIP][18] ([i915#9906]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html
    - bat-twl-2:          NOTRUN -> [SKIP][19] ([i915#9906]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-twl-2/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#9906]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][21] +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-8809g/igt@kms_vrr@flip-basic-fastset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][22] +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-ivb-3770/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-14:         NOTRUN -> [SKIP][23] ([i915#9906]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-14/igt@kms_vrr@flip-basic-fastset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][24] +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html
    - bat-arls-5:         NOTRUN -> [SKIP][25] ([i915#8808] / [i915#9906]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-5/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-8:          NOTRUN -> [SKIP][26] ([i915#9906]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - bat-dg1-7:          NOTRUN -> [SKIP][27] ([i915#3555]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg1-7/igt@kms_vrr@flip-dpms.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][28] +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-glk-j4005/igt@kms_vrr@flip-dpms.html
    - bat-dg2-11:         NOTRUN -> [SKIP][29] ([i915#3555]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-11/igt@kms_vrr@flip-dpms.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][30] +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][31] +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-cfl-8700k/igt@kms_vrr@flipline.html
    - bat-apl-1:          NOTRUN -> [SKIP][32] +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-apl-1/igt@kms_vrr@flipline.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-blb-e6850/igt@kms_vrr@flipline.html
    - bat-dg2-14:         NOTRUN -> [SKIP][34] ([i915#3555]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-14/igt@kms_vrr@flipline.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][35] +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-bsw-nick/igt@kms_vrr@flipline.html
    - bat-kbl-2:          NOTRUN -> [SKIP][36] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-kbl-2/igt@kms_vrr@flipline.html
    - bat-arls-5:         NOTRUN -> [SKIP][37] ([i915#8808]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-5/igt@kms_vrr@flipline.html
    - bat-adlp-6:         NOTRUN -> [SKIP][38] ([i915#3555]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-adlp-6/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][39] ([i915#3555]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-rplp-1/igt@kms_vrr@flipline.html
    - bat-arlh-2:         NOTRUN -> [SKIP][40] ([i915#11346]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arlh-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - bat-rplp-1:         NOTRUN -> [SKIP][41] ([i915#9906]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-rplp-1/igt@kms_vrr@max-min.html
    - fi-ilk-650:         NOTRUN -> [SKIP][42] +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-ilk-650/igt@kms_vrr@max-min.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][43] ([i915#9906]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-tgl-1115g4/igt@kms_vrr@max-min.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][44] +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-bsw-n3050/igt@kms_vrr@max-min.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][45] ([i915#9792]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-mtlp-6/igt@kms_vrr@max-min.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][46] ([i915#8808] / [i915#9906]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-mtlp-9/igt@kms_vrr@max-min.html
    - bat-arls-6:         NOTRUN -> [SKIP][47] ([i915#8808] / [i915#9906]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-6/igt@kms_vrr@max-min.html
    - bat-dg2-9:          NOTRUN -> [SKIP][48] ([i915#9906]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-9/igt@kms_vrr@max-min.html
    - bat-adlp-6:         NOTRUN -> [SKIP][49] ([i915#9906]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-adlp-6/igt@kms_vrr@max-min.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][50] ([i915#9906]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-rkl-11600/igt@kms_vrr@max-min.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8304 -> IGTPW_12922
  * Linux: CI_DRM_16367 -> CI_DRM_16370

  CI-20190529: 20190529
  CI_DRM_16367: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16370: bc18da45d48d337b92a7ff9546ba61da32b3b586 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12922: 12922
  IGT_8304: 8304

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/index.html

--===============4368486968232053962==
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
<tr><td><b>Series:</b></td><td>Bucketize refresh rate tolerance (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146850/">https://patchwork.freedesktop.org/series/146850/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8304 -&gt; IGTPW_12922</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12922 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12922, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Additional (1): bat-arlh-2 <br />
  Missing    (2): bat-adlp-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12922:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arlh-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-twl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-twl-2/igt@kms_vrr@flip-dpms.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-adls-6/igt@kms_vrr@max-min.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8304 and IGTPW_12922:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_vrr@flip-basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.42, 10.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.62, 10.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [11.51, 11.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [20.47, 20.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [5.38, 5.49] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12922 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-atsm-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +5 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-mtlp-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-x1275/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-hsw-4770/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-cfl-8109u/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg1-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +5 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> +5 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-twl-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-8809g/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-ivb-3770/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-14/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +5 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg1-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-glk-j4005/igt@kms_vrr@flip-dpms.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-11/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-kbl-7567u/igt@kms_vrr@flip-dpms.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-cfl-8700k/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-apl-1/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-blb-e6850/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-14/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-bsw-nick/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-kbl-2/igt@kms_vrr@flipline.html">SKIP</a> +5 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-adlp-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arlh-2/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-rplp-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-ilk-650/igt@kms_vrr@max-min.html">SKIP</a> +5 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-tgl-1115g4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-bsw-n3050/igt@kms_vrr@max-min.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-mtlp-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +5 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-mtlp-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-arls-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-dg2-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/bat-adlp-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12922/fi-rkl-11600/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8304 -&gt; IGTPW_12922</li>
<li>Linux: CI_DRM_16367 -&gt; CI_DRM_16370</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16367: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16370: bc18da45d48d337b92a7ff9546ba61da32b3b586 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12922: 12922<br />
  IGT_8304: 8304</p>

</body>
</html>

--===============4368486968232053962==--
