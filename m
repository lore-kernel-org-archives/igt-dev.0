Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B8C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 13:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F208610E5BD;
	Tue, 21 Jan 2025 13:54:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E850D10E5B8;
 Tue, 21 Jan 2025 13:54:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4210003703689112100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Integrat_kmemleak_scans_in_?=
 =?utf-8?q?igt=5Frunner?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jan 2025 13:54:24 -0000
Message-ID: <173746766494.2615997.15598083353918335979@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
In-Reply-To: <20250121112944.115491-1-peter.senna@linux.intel.com>
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

--===============4210003703689112100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Integrat kmemleak scans in igt_runner
URL   : https://patchwork.freedesktop.org/series/143791/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8202_BAT -> XEIGTPW_12473_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 6)
------------------------------

  Missing    (2): bat-lnl-2 bat-adlp-vf 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8202 -> IGTPW_12473

  IGTPW_12473: a9e69f724997d14d9da05d0a10f0d042ad5aa0c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8202: 9106f62ab151804d5f545bc0707a37c3512a2476 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2518-bb123c6e757601d42f71952d879b35f97472d56b: bb123c6e757601d42f71952d879b35f97472d56b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/index.html

--===============4210003703689112100==
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
<tr><td><b>Series:</b></td><td>Integrat kmemleak scans in igt_runner</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143791/">https://patchwork.freedesktop.org/series/143791/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8202_BAT -&gt; XEIGTPW_12473_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 6)</h2>
<p>Missing    (2): bat-lnl-2 bat-adlp-vf </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8202 -&gt; IGTPW_12473</li>
</ul>
<p>IGTPW_12473: a9e69f724997d14d9da05d0a10f0d042ad5aa0c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8202: 9106f62ab151804d5f545bc0707a37c3512a2476 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2518-bb123c6e757601d42f71952d879b35f97472d56b: bb123c6e757601d42f71952d879b35f97472d56b</p>

</body>
</html>

--===============4210003703689112100==--
