Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7789C3271E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 05:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8454710E2D2;
	Thu, 11 Jul 2024 05:13:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1910E2D2;
 Thu, 11 Jul 2024 05:13:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4770537458075175741=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Runtime_alteration_of_debug?=
 =?utf-8?q?log_level_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jul 2024 05:13:19 -0000
Message-ID: <172067479907.124165.5462149852127882442@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711041355.749937-1-pranay.samala@intel.com>
In-Reply-To: <20240711041355.749937-1-pranay.samala@intel.com>
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

--===============4770537458075175741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Runtime alteration of debuglog level (rev3)
URL   : https://patchwork.freedesktop.org/series/135823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15060 -> IGTPW_11397
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11397 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11397, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-dg2-11 fi-snb-2520m fi-elk-e7500 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11397:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:
    - bat-adls-6:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adls-6/igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11397 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition:
    - bat-mtlp-6:         NOTRUN -> [SKIP][2] ([i915#9792]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-mtlp-6/igt@kms_atomic_transition@modeset-transition.html
    - bat-dg2-9:          NOTRUN -> [SKIP][3] ([i915#9197]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg2-9/igt@kms_atomic_transition@modeset-transition.html
    - bat-adlp-11:        NOTRUN -> [SKIP][4] ([i915#10470] / [i915#10501]) +10 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlp-11/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - bat-atsm-1:         NOTRUN -> [SKIP][5] ([i915#6078]) +15 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-atsm-1/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - bat-rplp-1:         NOTRUN -> [SKIP][6] ([i915#3555]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-rplp-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - bat-arls-2:         NOTRUN -> [SKIP][7] ([i915#11589] / [i915#1769]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arls-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#1769] / [i915#3555]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - bat-jsl-1:          NOTRUN -> [SKIP][9] ([i915#1769] / [i915#3555]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-jsl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - bat-twl-2:          NOTRUN -> [SKIP][10] ([i915#1769]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-twl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - bat-twl-1:          NOTRUN -> [SKIP][11] ([i915#1769]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-twl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#1769] / [i915#3555]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adls-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][13] ([i915#1769]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-cfl-8700k/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-apl-1:          NOTRUN -> [SKIP][14] ([i915#1769]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-apl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-kbl-2:          NOTRUN -> [SKIP][15] +15 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-kbl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-arls-5:         NOTRUN -> [SKIP][16] ([i915#1769]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arls-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-arlh-2:         NOTRUN -> [SKIP][17] ([i915#11346]) +14 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arlh-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#1769] / [i915#3555]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-rkl-11600/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-dg1-7:          NOTRUN -> [SKIP][19] ([i915#1769] / [i915#3555]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg1-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-rpls-4:         NOTRUN -> [SKIP][20] ([i915#1769] / [i915#3555]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-rpls-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][21] ([i915#1769]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-cfl-8109u/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][22] ([i915#1769]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-kbl-7567u/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][23] ([i915#1769]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-ivb-3770/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - bat-dg2-14:         NOTRUN -> [SKIP][24] ([i915#1769] / [i915#3555]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg2-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][25] ([i915#1769]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-cfl-guc/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - bat-dg2-8:          NOTRUN -> [SKIP][26] ([i915#1769] / [i915#3555]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][27] +15 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-kbl-guc/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - fi-ilk-650:         NOTRUN -> [SKIP][28] ([i915#1769]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-ilk-650/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][29] ([i915#1769] / [i915#3555]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-tgl-1115g4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - bat-arls-1:         NOTRUN -> [SKIP][30] ([i915#1769]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arls-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][31] ([i915#1769]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-bsw-n3050/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][32] ([i915#1769]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-glk-j4005/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - bat-adlp-9:         NOTRUN -> [SKIP][33] ([i915#1769] / [i915#3555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][34] +15 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-kbl-x1275/igt@kms_atomic_transition@plane-all-transition-fencing.html
    - bat-adlp-11:        NOTRUN -> [SKIP][35] ([i915#10470]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlp-11/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - bat-adlm-1:         NOTRUN -> [SKIP][36] ([i915#9900]) +15 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlm-1/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - fi-pnv-d510:        NOTRUN -> [SKIP][37] +15 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-pnv-d510/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - fi-blb-e6850:       NOTRUN -> [SKIP][38] +15 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-blb-e6850/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - bat-arlh-2:         NOTRUN -> [SKIP][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arlh-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11589]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11589
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7922 -> IGTPW_11397

  CI-20190529: 20190529
  CI_DRM_15060: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11397: 11397
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/index.html

--===============4770537458075175741==
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
<tr><td><b>Series:</b></td><td>Runtime alteration of debuglog level (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135823/">https://patchwork.freedesktop.org/series/135823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15060 -&gt; IGTPW_11397</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11397 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11397, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-dg2-11 fi-snb-2520m fi-elk-e7500 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11397:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adls-6/igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11397 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-mtlp-6/igt@kms_atomic_transition@modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +15 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg2-9/igt@kms_atomic_transition@modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +15 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlp-11/igt@kms_atomic_transition@modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-atsm-1/igt@kms_atomic_transition@modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-rplp-1/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arls-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11589">i915#11589</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-jsl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-twl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-twl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adls-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-cfl-8700k/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-apl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-kbl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> +15 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arls-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arlh-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +14 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-rkl-11600/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg1-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-rpls-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-cfl-8109u/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-kbl-7567u/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-ivb-3770/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg2-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-cfl-guc/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-kbl-guc/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> +15 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-ilk-650/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-tgl-1115g4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arls-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-bsw-n3050/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-glk-j4005/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-kbl-x1275/igt@kms_atomic_transition@plane-all-transition-fencing.html">SKIP</a> +15 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlp-11/igt@kms_atomic_transition@plane-all-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-adlm-1/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-pnv-d510/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/fi-blb-e6850/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11397/bat-arlh-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7922 -&gt; IGTPW_11397</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15060: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11397: 11397<br />
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4770537458075175741==--
