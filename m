Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C65CA0EC0
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 10:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F017310E41F;
	Mon, 18 Aug 2025 10:13:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B3410E41F;
 Mon, 18 Aug 2025 10:13:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8230899009286732368=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Shaders_migration_to_sepa?=
 =?utf-8?q?rate_headers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Aug 2025 10:13:15 -0000
Message-ID: <175551199577.243606.8551514517153230416@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
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

--===============8230899009286732368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Shaders migration to separate headers (rev2)
URL   : https://patchwork.freedesktop.org/series/152864/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8495 -> IGTPW_13587
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13587 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13587, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13587:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-hsw-4770/igt@runner@aborted.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-ivb-3770/igt@runner@aborted.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-elk-e7500/igt@runner@aborted.html
    - fi-ilk-650:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-ilk-650/igt@runner@aborted.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-bsw-n3050/igt@runner@aborted.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-skl-6600u/igt@runner@aborted.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-pnv-d510/igt@runner@aborted.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-glk-j4005/igt@runner@aborted.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-cfl-8700k/igt@runner@aborted.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-bsw-nick/igt@runner@aborted.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-rkl-11600/igt@runner@aborted.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-cfl-guc/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_13587 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][13] ([i915#14832])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-x1275/igt@runner@aborted.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][14] ([i915#14832])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-8809g/igt@runner@aborted.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][15] ([i915#14489])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-mtlp-8/igt@runner@aborted.html
    - bat-dg1-6:          NOTRUN -> [FAIL][16] ([i915#14832])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg1-6/igt@runner@aborted.html
    - bat-dg2-8:          NOTRUN -> [FAIL][17] ([i915#14832])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-8/igt@runner@aborted.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][18] ([i915#14832])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-guc/igt@runner@aborted.html
    - bat-adls-6:         NOTRUN -> [FAIL][19] ([i915#14832])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-adls-6/igt@runner@aborted.html
    - bat-jsl-1:          NOTRUN -> [FAIL][20] ([i915#14832])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-jsl-1/igt@runner@aborted.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][21] ([i915#14749])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-tgl-1115g4/igt@runner@aborted.html
    - bat-adlp-6:         NOTRUN -> [FAIL][22] ([i915#14832])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-adlp-6/igt@runner@aborted.html
    - bat-mtlp-6:         NOTRUN -> [FAIL][23] ([i915#14489])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-mtlp-6/igt@runner@aborted.html
    - bat-arls-6:         NOTRUN -> [FAIL][24] ([i915#14832])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arls-6/igt@runner@aborted.html
    - bat-arlh-3:         NOTRUN -> [FAIL][25] ([i915#14832])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arlh-3/igt@runner@aborted.html
    - bat-dg1-7:          NOTRUN -> [FAIL][26] ([i915#14832])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg1-7/igt@runner@aborted.html
    - bat-adlp-9:         NOTRUN -> [FAIL][27] ([i915#14832])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-adlp-9/igt@runner@aborted.html
    - bat-twl-2:          NOTRUN -> [FAIL][28] ([i915#14832])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-twl-2/igt@runner@aborted.html
    - bat-dg2-11:         NOTRUN -> [FAIL][29] ([i915#14832])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-11/igt@runner@aborted.html
    - bat-rpls-4:         NOTRUN -> [FAIL][30] ([i915#14832])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-rpls-4/igt@runner@aborted.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][31] ([i915#14832])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-7567u/igt@runner@aborted.html
    - bat-twl-1:          NOTRUN -> [FAIL][32] ([i915#14832])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-twl-1/igt@runner@aborted.html
    - bat-apl-1:          NOTRUN -> [FAIL][33] ([i915#14832])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-apl-1/igt@runner@aborted.html
    - bat-dg2-14:         NOTRUN -> [FAIL][34] ([i915#14832])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-14/igt@runner@aborted.html
    - bat-kbl-2:          NOTRUN -> [FAIL][35] ([i915#14832])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-kbl-2/igt@runner@aborted.html
    - bat-arls-5:         NOTRUN -> [FAIL][36] ([i915#14832])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arls-5/igt@runner@aborted.html
    - bat-rplp-1:         NOTRUN -> [FAIL][37] ([i915#14832])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-rplp-1/igt@runner@aborted.html
    - bat-arlh-2:         NOTRUN -> [FAIL][38] ([i915#14832])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arlh-2/igt@runner@aborted.html
    - bat-atsm-1:         NOTRUN -> [FAIL][39] ([i915#14832])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-atsm-1/igt@runner@aborted.html
    - bat-dg2-13:         NOTRUN -> [FAIL][40] ([i915#14832])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-13/igt@runner@aborted.html
    - bat-mtlp-9:         NOTRUN -> [FAIL][41] ([i915#14489])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-mtlp-9/igt@runner@aborted.html
    - bat-dg2-9:          NOTRUN -> [FAIL][42] ([i915#14832])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-9/igt@runner@aborted.html

  
  [i915#14489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489
  [i915#14749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14749
  [i915#14832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8495 -> IGTPW_13587
  * Linux: CI_DRM_17006 -> CI_DRM_17022

  CI-20190529: 20190529
  CI_DRM_17006: 7582d01b3cb80604bd700c37237effb7b5c6fe6e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17022: fd212b0ad33ee6f49ab70d807eeefe90db36e68a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13587: 13587
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/index.html

--===============8230899009286732368==
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
<tr><td><b>Series:</b></td><td>Shaders migration to separate headers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152864/">https://patchwork.freedesktop.org/series/152864/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8495 -&gt; IGTPW_13587</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13587 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13587, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13587:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-hsw-4770/igt@runner@aborted.html">FAIL</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-ivb-3770/igt@runner@aborted.html">FAIL</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-elk-e7500/igt@runner@aborted.html">FAIL</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-ilk-650/igt@runner@aborted.html">FAIL</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a></li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-skl-6600u/igt@runner@aborted.html">FAIL</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-pnv-d510/igt@runner@aborted.html">FAIL</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-glk-j4005/igt@runner@aborted.html">FAIL</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a></li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-bsw-nick/igt@runner@aborted.html">FAIL</a></li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-rkl-11600/igt@runner@aborted.html">FAIL</a></li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-cfl-guc/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13587 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-mtlp-8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489">i915#14489</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-adls-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-jsl-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14749">i915#14749</a>)</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-adlp-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-mtlp-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489">i915#14489</a>)</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arls-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arlh-3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg1-7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-adlp-9/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-twl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-11/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-rpls-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-twl-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-apl-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-14/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-kbl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arls-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-rplp-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-arlh-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-atsm-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-13/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-mtlp-9/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489">i915#14489</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13587/bat-dg2-9/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14832">i915#14832</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8495 -&gt; IGTPW_13587</li>
<li>Linux: CI_DRM_17006 -&gt; CI_DRM_17022</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17006: 7582d01b3cb80604bd700c37237effb7b5c6fe6e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17022: fd212b0ad33ee6f49ab70d807eeefe90db36e68a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13587: 13587<br />
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8230899009286732368==--
