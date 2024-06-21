Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E1EC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 20:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1833710E02D;
	Fri, 21 Jun 2024 20:26:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0FE10E02D;
 Fri, 21 Jun 2024 20:26:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7200877960586388344=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_support_for_hook_script_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Jun 2024 20:26:40 -0000
Message-ID: <171900160022.132113.9492550284968991085@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
In-Reply-To: <20240621195150.390462-1-gustavo.sousa@intel.com>
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

--===============7200877960586388344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for hook script (rev2)
URL   : https://patchwork.freedesktop.org/series/133391/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7895_BAT -> XEIGTPW_11295_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7895 -> IGTPW_11295
  * Linux: xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc -> xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a

  IGTPW_11295: 11295
  IGT_7895: 7895
  xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc: 40deb379b103746ee4c9df5f0f1919bd4703c9cc
  xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a: 383dc44a79848f13f2430c9ed811b5c9b22b882a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11295/index.html

--===============7200877960586388344==
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
<tr><td><b>Series:</b></td><td>Add support for hook script (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133391/">https://patchwork.freedesktop.org/series/133391/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11295/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11295/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7895_BAT -&gt; XEIGTPW_11295_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7895 -&gt; IGTPW_11295</li>
<li>Linux: xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc -&gt; xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a</li>
</ul>
<p>IGTPW_11295: 11295<br />
  IGT_7895: 7895<br />
  xe-1512-40deb379b103746ee4c9df5f0f1919bd4703c9cc: 40deb379b103746ee4c9df5f0f1919bd4703c9cc<br />
  xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a: 383dc44a79848f13f2430c9ed811b5c9b22b882a</p>

</body>
</html>

--===============7200877960586388344==--
