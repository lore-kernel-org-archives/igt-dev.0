Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457D6C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE49710E80E;
	Mon, 13 Jul 2026 08:49:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1410E874;
 Mon, 13 Jul 2026 08:49:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8910031986023968317=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fforce=5Fconnect?=
 =?utf-8?q?or=5Fbasic=3A_re-baseline_connector_state_before_comparing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jul 2026 08:49:13 -0000
Message-ID: <178393255315.182092.14237945573066929822@6beec6c84f66>
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

--===============8910031986023968317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: re-baseline connector state before comparing
URL   : https://patchwork.freedesktop.org/series/170294/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9003_BAT -> XEIGTPW_15517_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15517_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15517_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-ptl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15517_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-adlp-7/igt@kms_force_connector_basic@force-edid.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-adlp-7/igt@kms_force_connector_basic@force-edid.html
    - bat-bmg-1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-bmg-1/igt@kms_force_connector_basic@force-edid.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-bmg-1/igt@kms_force_connector_basic@force-edid.html
    - bat-wcl-2:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-wcl-2/igt@kms_force_connector_basic@force-edid.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-wcl-2/igt@kms_force_connector_basic@force-edid.html
    - bat-ptl-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-ptl-2/igt@kms_force_connector_basic@force-edid.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-ptl-2/igt@kms_force_connector_basic@force-edid.html
    - bat-wcl-1:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-wcl-1/igt@kms_force_connector_basic@force-edid.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-wcl-1/igt@kms_force_connector_basic@force-edid.html

  


Build changes
-------------

  * IGT: IGT_9003 -> IGTPW_15517

  IGTPW_15517: 15517
  IGT_9003: 9003
  xe-5390-f8ed2f7559466d59169b7a840c2403a0d4614f88: f8ed2f7559466d59169b7a840c2403a0d4614f88

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/index.html

--===============8910031986023968317==
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

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9003_BAT -&gt; XEIGTPW_15517_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15517_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15517_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-ptl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15517_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-adlp-7/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-adlp-7/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-bmg-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-bmg-1/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-wcl-2/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-wcl-2/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-ptl-2/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-ptl-2/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9003/bat-wcl-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15517/bat-wcl-1/igt@kms_force_connector_basic@force-edid.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9003 -&gt; IGTPW_15517</li>
</ul>
<p>IGTPW_15517: 15517<br />
  IGT_9003: 9003<br />
  xe-5390-f8ed2f7559466d59169b7a840c2403a0d4614f88: f8ed2f7559466d59169b7a840c2403a0d4614f88</p>

</body>
</html>

--===============8910031986023968317==--
