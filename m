Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FF2CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 21:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86C810E561;
	Tue, 16 Sep 2025 21:18:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3210E561;
 Tue, 16 Sep 2025 21:18:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7874886733802101428=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fsetmode=3A_Fix_?=
 =?utf-8?q?clone_mode_mismatch_by_preferring_eDP_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Sep 2025 21:18:24 -0000
Message-ID: <175805750420.339404.8515745265282057155@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250916091800.1348207-1-jeevan.b@intel.com>
In-Reply-To: <20250916091800.1348207-1-jeevan.b@intel.com>
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

--===============7874886733802101428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode (rev3)
URL   : https://patchwork.freedesktop.org/series/151429/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8541_BAT -> XEIGTPW_13754_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13754_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2] ([Intel XE#5507]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8541/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13754/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507


Build changes
-------------

  * IGT: IGT_8541 -> IGTPW_13754
  * Linux: xe-3769-bbb6481c2b5e8ff72500665846dc121b6f093481 -> xe-3776-c3610fc0ab7c1c668031b3804549187d75550e93

  IGTPW_13754: 13754
  IGT_8541: 8541
  xe-3769-bbb6481c2b5e8ff72500665846dc121b6f093481: bbb6481c2b5e8ff72500665846dc121b6f093481
  xe-3776-c3610fc0ab7c1c668031b3804549187d75550e93: c3610fc0ab7c1c668031b3804549187d75550e93

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13754/index.html

--===============7874886733802101428==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151429/">https://patchwork.freedesktop.org/series/151429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13754/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13754/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8541_BAT -&gt; XEIGTPW_13754_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13754_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8541/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13754/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8541 -&gt; IGTPW_13754</li>
<li>Linux: xe-3769-bbb6481c2b5e8ff72500665846dc121b6f093481 -&gt; xe-3776-c3610fc0ab7c1c668031b3804549187d75550e93</li>
</ul>
<p>IGTPW_13754: 13754<br />
  IGT_8541: 8541<br />
  xe-3769-bbb6481c2b5e8ff72500665846dc121b6f093481: bbb6481c2b5e8ff72500665846dc121b6f093481<br />
  xe-3776-c3610fc0ab7c1c668031b3804549187d75550e93: c3610fc0ab7c1c668031b3804549187d75550e93</p>

</body>
</html>

--===============7874886733802101428==--
