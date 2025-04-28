Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B42CC369D5
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 21:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC4A10E284;
	Mon, 28 Apr 2025 21:03:30 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39F10E284;
 Mon, 28 Apr 2025 21:03:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4731429032400394025=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel=3A_Add_blocklis?=
 =?utf-8?q?ts_and_test=5Fconfig_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 28 Apr 2025 21:03:29 -0000
Message-ID: <174587420923.22070.16312079170318082830@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428061940.86004-1-karthik.b.s@intel.com>
In-Reply-To: <20250428061940.86004-1-karthik.b.s@intel.com>
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

--===============4731429032400394025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add blocklists and test_config (rev3)
URL   : https://patchwork.freedesktop.org/series/147819/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8341_BAT -> XEIGT_8342_BAT
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

  * IGT: IGT_8341 -> IGT_8342
  * Linux: xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee -> xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed

  IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8342: 8342
  xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee: 4dfede9f7f69716060d29d84a1267f893da9dbee
  xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed: f6fc27d337f1078e14de1ef319a92b4e50203aed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13048/index.html

--===============4731429032400394025==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add blocklists and test_config (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147819/">https://patchwork.freedesktop.org/series/147819/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13048/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13048/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8341_BAT -&gt; XEIGT_8342_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8341 -&gt; IGT_8342</li>
<li>Linux: xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee -&gt; xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed</li>
</ul>
<p>IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8342: 8342<br />
  xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee: 4dfede9f7f69716060d29d84a1267f893da9dbee<br />
  xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed: f6fc27d337f1078e14de1ef319a92b4e50203aed</p>

</body>
</html>

--===============4731429032400394025==--
