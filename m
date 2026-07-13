Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2446BC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C652210E5B3;
	Mon, 13 Jul 2026 09:04:36 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0354B10E5B3;
 Mon, 13 Jul 2026 09:02:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3066434687243598380=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fforce=5Fconne?=
 =?utf-8?q?ctor=5Fbasic=3A_re-baseline_connector_state_before_comparing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jul 2026 09:02:27 -0000
Message-ID: <178393334700.182092.17538235454687655313@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713080227.3989038-1-suraj.kandpal@intel.com>
In-Reply-To: <20260713080227.3989038-1-suraj.kandpal@intel.com>
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

--===============3066434687243598380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: re-baseline connector state before comparing
URL   : https://patchwork.freedesktop.org/series/170294/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9003 -> IGTPW_15517
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15517 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15517, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15517:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-mtlp-8:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html
    - bat-dg2-8:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
    - fi-bsw-n3050:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-bsw-n3050/igt@kms_force_connector_basic@force-edid.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-bsw-n3050/igt@kms_force_connector_basic@force-edid.html
    - bat-arlh-3:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-arlh-3/igt@kms_force_connector_basic@force-edid.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-arlh-3/igt@kms_force_connector_basic@force-edid.html
    - bat-dg1-7:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg1-7/igt@kms_force_connector_basic@force-edid.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg1-7/igt@kms_force_connector_basic@force-edid.html
    - bat-adlp-9:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html
    - bat-rpls-4:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-rpls-4/igt@kms_force_connector_basic@force-edid.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-rpls-4/igt@kms_force_connector_basic@force-edid.html
    - fi-kbl-7567u:       [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-kbl-7567u/igt@kms_force_connector_basic@force-edid.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-kbl-7567u/igt@kms_force_connector_basic@force-edid.html
    - bat-twl-1:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-twl-1/igt@kms_force_connector_basic@force-edid.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-twl-1/igt@kms_force_connector_basic@force-edid.html
    - bat-arls-5:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-arls-5/igt@kms_force_connector_basic@force-edid.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-arls-5/igt@kms_force_connector_basic@force-edid.html
    - fi-rkl-11600:       [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-rkl-11600/igt@kms_force_connector_basic@force-edid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-rkl-11600/igt@kms_force_connector_basic@force-edid.html
    - bat-dg2-9:          [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html
    - fi-kbl-x1275:       [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
    - fi-cfl-8109u:       [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html
    - fi-kbl-8809g:       [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html
    - bat-dg1-6:          [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg1-6/igt@kms_force_connector_basic@force-edid.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg1-6/igt@kms_force_connector_basic@force-edid.html
    - bat-adlp-6:         [PASS][33] -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-adlp-6/igt@kms_force_connector_basic@force-edid.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-adlp-6/igt@kms_force_connector_basic@force-edid.html
    - fi-skl-6600u:       [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-skl-6600u/igt@kms_force_connector_basic@force-edid.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-skl-6600u/igt@kms_force_connector_basic@force-edid.html
    - bat-twl-2:          [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-twl-2/igt@kms_force_connector_basic@force-edid.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-twl-2/igt@kms_force_connector_basic@force-edid.html
    - bat-dg2-14:         [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg2-14/igt@kms_force_connector_basic@force-edid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg2-14/igt@kms_force_connector_basic@force-edid.html
    - fi-elk-e7500:       [PASS][41] -> [FAIL][42] +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-elk-e7500/igt@kms_force_connector_basic@force-edid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-elk-e7500/igt@kms_force_connector_basic@force-edid.html
    - fi-bsw-nick:        [PASS][43] -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-bsw-nick/igt@kms_force_connector_basic@force-edid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-bsw-nick/igt@kms_force_connector_basic@force-edid.html
    - bat-kbl-2:          [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-kbl-2/igt@kms_force_connector_basic@force-edid.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-kbl-2/igt@kms_force_connector_basic@force-edid.html
    - bat-mtlp-9:         [PASS][47] -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-mtlp-9/igt@kms_force_connector_basic@force-edid.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-mtlp-9/igt@kms_force_connector_basic@force-edid.html
    - bat-arls-6:         [PASS][49] -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-arls-6/igt@kms_force_connector_basic@force-edid.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-arls-6/igt@kms_force_connector_basic@force-edid.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9003 -> IGTPW_15517

  CI-20190529: 20190529
  CI_DRM_18809: f8ed2f7559466d59169b7a840c2403a0d4614f88 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15517: 15517
  IGT_9003: 9003

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/index.html

--===============3066434687243598380==
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
<tr><td><b>Series:</b></td><td>tests/kms_force_connector_basic: re-baseline connector state before comparing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170294/">https://patchwork.freedesktop.org/series/170294/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9003 -&gt; IGTPW_15517</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15517 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15517, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15517:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-mtlp-8/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-bsw-n3050/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-bsw-n3050/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-arlh-3/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-arlh-3/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg1-7/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg1-7/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-rpls-4/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-rpls-4/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-kbl-7567u/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-kbl-7567u/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-twl-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-twl-1/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-arls-5/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-arls-5/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-rkl-11600/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-rkl-11600/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-cfl-8109u/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg1-6/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg1-6/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-adlp-6/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-adlp-6/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-skl-6600u/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-skl-6600u/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-twl-2/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-twl-2/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-dg2-14/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-dg2-14/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-elk-e7500/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-elk-e7500/igt@kms_force_connector_basic@force-edid.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/fi-bsw-nick/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/fi-bsw-nick/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-kbl-2/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-kbl-2/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-mtlp-9/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-mtlp-9/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9003/bat-arls-6/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15517/bat-arls-6/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9003 -&gt; IGTPW_15517</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18809: f8ed2f7559466d59169b7a840c2403a0d4614f88 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15517: 15517<br />
  IGT_9003: 9003</p>

</body>
</html>

--===============3066434687243598380==--
