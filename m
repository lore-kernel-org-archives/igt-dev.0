Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2187C3DA7F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 11:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5110E964;
	Fri, 26 Jul 2024 11:52:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C23F10E964;
 Fri, 26 Jul 2024 11:52:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6605457730831275163=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Improvise-the-deep-pkgc_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 26 Jul 2024 11:52:03 -0000
Message-ID: <172199472356.385824.12718606343137486840@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
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

--===============6605457730831275163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improvise-the-deep-pkgc (rev3)
URL   : https://patchwork.freedesktop.org/series/136055/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7939 -> IGTPW_11476
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11476 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11476, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (3): fi-kbl-8809g bat-mtlp-6 fi-pnv-d510 
  Missing    (3): bat-mtlp-8 bat-dg1-7 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11476:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_dc@deep-pkgc:
    - bat-twl-1:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-twl-1/igt@kms_pm_dc@deep-pkgc.html
    - bat-rplp-1:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-rplp-1/igt@kms_pm_dc@deep-pkgc.html
    - bat-twl-2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-twl-2/igt@kms_pm_dc@deep-pkgc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pm_dc@deep-pkgc:
    - {bat-arlh-3}:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arlh-3/igt@kms_pm_dc@deep-pkgc.html

  
Known issues
------------

  Here are the changes found in IGTPW_11476 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [PASS][5] -> [INCOMPLETE][6] ([i915#9413])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7939/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_pm_dc@deep-pkgc:
    - bat-rpls-4:         NOTRUN -> [SKIP][7] ([i915#3828])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-rpls-4/igt@kms_pm_dc@deep-pkgc.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-7567u/igt@kms_pm_dc@deep-pkgc.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-cfl-8700k/igt@kms_pm_dc@deep-pkgc.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-8809g/igt@kms_pm_dc@deep-pkgc.html
    - bat-apl-1:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-apl-1/igt@kms_pm_dc@deep-pkgc.html
    - bat-dg2-14:         NOTRUN -> [SKIP][12] ([i915#3828])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-14/igt@kms_pm_dc@deep-pkgc.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-elk-e7500/igt@kms_pm_dc@deep-pkgc.html
    - bat-kbl-2:          NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-kbl-2/igt@kms_pm_dc@deep-pkgc.html
    - bat-arls-5:         NOTRUN -> [SKIP][15] ([i915#3828])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arls-5/igt@kms_pm_dc@deep-pkgc.html
    - bat-adlm-1:         NOTRUN -> [SKIP][16] ([i915#3361])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlm-1/igt@kms_pm_dc@deep-pkgc.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#3828])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-rkl-11600/igt@kms_pm_dc@deep-pkgc.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][18] ([i915#3828])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-tgl-1115g4/igt@kms_pm_dc@deep-pkgc.html
    - bat-atsm-1:         NOTRUN -> [SKIP][19] ([i915#6078])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-atsm-1/igt@kms_pm_dc@deep-pkgc.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-cfl-guc/igt@kms_pm_dc@deep-pkgc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][21] ([i915#3828])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-mtlp-6/igt@kms_pm_dc@deep-pkgc.html
    - bat-dg2-9:          NOTRUN -> [SKIP][22] ([i915#3828])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-9/igt@kms_pm_dc@deep-pkgc.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-x1275/igt@kms_pm_dc@deep-pkgc.html
    - bat-adlp-11:        NOTRUN -> [SKIP][24] ([i915#3828])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-11/igt@kms_pm_dc@deep-pkgc.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-cfl-8109u/igt@kms_pm_dc@deep-pkgc.html
    - bat-arls-2:         NOTRUN -> [SKIP][26] ([i915#3828])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arls-2/igt@kms_pm_dc@deep-pkgc.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-ivb-3770/igt@kms_pm_dc@deep-pkgc.html
    - bat-dg2-8:          NOTRUN -> [SKIP][28] ([i915#3361])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-8/igt@kms_pm_dc@deep-pkgc.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-guc/igt@kms_pm_dc@deep-pkgc.html
    - bat-adls-6:         NOTRUN -> [SKIP][30] ([i915#3361])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adls-6/igt@kms_pm_dc@deep-pkgc.html
    - fi-ilk-650:         NOTRUN -> [SKIP][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-ilk-650/igt@kms_pm_dc@deep-pkgc.html
    - bat-jsl-1:          NOTRUN -> [SKIP][32] ([i915#3828])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-jsl-1/igt@kms_pm_dc@deep-pkgc.html
    - bat-arls-1:         NOTRUN -> [SKIP][33] ([i915#3828])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arls-1/igt@kms_pm_dc@deep-pkgc.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-blb-e6850/igt@kms_pm_dc@deep-pkgc.html
    - bat-adlp-6:         NOTRUN -> [SKIP][35] ([i915#3828])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-6/igt@kms_pm_dc@deep-pkgc.html
    - bat-arlh-2:         NOTRUN -> [SKIP][36] ([i915#11346])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arlh-2/igt@kms_pm_dc@deep-pkgc.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-pnv-d510/igt@kms_pm_dc@deep-pkgc.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-glk-j4005/igt@kms_pm_dc@deep-pkgc.html
    - bat-adlp-9:         NOTRUN -> [SKIP][39] ([i915#3828])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-9/igt@kms_pm_dc@deep-pkgc.html
    - bat-dg2-11:         NOTRUN -> [SKIP][40] ([i915#3828])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-11/igt@kms_pm_dc@deep-pkgc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7939 -> IGTPW_11476

  CI-20190529: 20190529
  CI_DRM_15136: edd84625d093bb52bfb1c0c6feb12cff308d81b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11476: 11476
  IGT_7939: 7939

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/index.html

--===============6605457730831275163==
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
<tr><td><b>Series:</b></td><td>Improvise-the-deep-pkgc (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136055/">https://patchwork.freedesktop.org/series/136055/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7939 -&gt; IGTPW_11476</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11476 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11476, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (3): fi-kbl-8809g bat-mtlp-6 fi-pnv-d510 <br />
  Missing    (3): bat-mtlp-8 bat-dg1-7 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11476:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_dc@deep-pkgc:<ul>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-twl-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-rplp-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-twl-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pm_dc@deep-pkgc:<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arlh-3/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11476 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7939/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-rpls-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-7567u/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-cfl-8700k/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-8809g/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-apl-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-14/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-elk-e7500/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-kbl-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arls-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlm-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-rkl-11600/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-tgl-1115g4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-atsm-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>)</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-cfl-guc/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-mtlp-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-9/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-x1275/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-11/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-cfl-8109u/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arls-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-ivb-3770/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-kbl-guc/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adls-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-ilk-650/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-jsl-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arls-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-blb-e6850/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-arlh-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-pnv-d510/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/fi-glk-j4005/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-adlp-9/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11476/bat-dg2-11/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7939 -&gt; IGTPW_11476</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15136: edd84625d093bb52bfb1c0c6feb12cff308d81b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11476: 11476<br />
  IGT_7939: 7939</p>

</body>
</html>

--===============6605457730831275163==--
