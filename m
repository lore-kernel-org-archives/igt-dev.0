Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F28C87FC5
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 17:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AB910E9A4;
	Thu, 24 Jul 2025 17:11:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED68F10E9A4;
 Thu, 24 Jul 2025 17:11:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0829948755008595159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fdebugfs=3A_Use_?=
 =?utf-8?q?static_var_for_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Jul 2025 17:11:33 -0000
Message-ID: <175337709396.187925.6066311509036396225@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724122710.192060-1-peter.senna@linux.intel.com>
In-Reply-To: <20250724122710.192060-1-peter.senna@linux.intel.com>
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

--===============0829948755008595159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_debugfs: Use static var for display
URL   : https://patchwork.freedesktop.org/series/152061/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8476_BAT -> XEIGTPW_13523_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8476 -> IGTPW_13523

  IGTPW_13523: 6f3762085fc4354207775e0171c1405f87e7cb67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a: 2fe30dbc18cd98a593fa26398fe0147381ca716a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13523/index.html

--===============0829948755008595159==
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
<tr><td><b>Series:</b></td><td>tests/kms_debugfs: Use static var for display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152061/">https://patchwork.freedesktop.org/series/152061/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13523/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13523/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8476_BAT -&gt; XEIGTPW_13523_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8476 -&gt; IGTPW_13523</li>
</ul>
<p>IGTPW_13523: 6f3762085fc4354207775e0171c1405f87e7cb67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3470-2fe30dbc18cd98a593fa26398fe0147381ca716a: 2fe30dbc18cd98a593fa26398fe0147381ca716a</p>

</body>
</html>

--===============0829948755008595159==--
