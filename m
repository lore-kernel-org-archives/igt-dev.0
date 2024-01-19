Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E4FC47422
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 02:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D91310E939;
	Fri, 19 Jan 2024 02:17:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5602810E929;
 Fri, 19 Jan 2024 02:17:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3471188316654879322=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/syncobj=5Ftimeline=3A_te?=
 =?utf-8?q?st_delayed_submission?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erik Kurzinger" <ekurzinger@nvidia.com>
Date: Fri, 19 Jan 2024 02:17:01 -0000
Message-ID: <170563062134.558567.1827441883714405391@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <e2500b3e-7ba4-45a9-ba67-4b6a24ecc25f@nvidia.com>
In-Reply-To: <e2500b3e-7ba4-45a9-ba67-4b6a24ecc25f@nvidia.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============3471188316654879322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/syncobj_timeline: test delayed submission
URL   : https://patchwork.freedesktop.org/series/128963/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7683_BAT -> XEIGTPW_10560_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7683 -> IGTPW_10560
  * Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -> xe-648-ed982e1f2709684a702b81cc5a0a0811570ab589

  IGTPW_10560: 10560
  IGT_7683: 7683
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad
  xe-648-ed982e1f2709684a702b81cc5a0a0811570ab589: ed982e1f2709684a702b81cc5a0a0811570ab589

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10560/index.html

--===============3471188316654879322==
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
<tr><td><b>Series:</b></td><td>tests/syncobj_timeline: test delayed submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128963/">https://patchwork.freedesktop.org/series/128963/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10560/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10560/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7683_BAT -&gt; XEIGTPW_10560_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7683 -&gt; IGTPW_10560</li>
<li>Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -&gt; xe-648-ed982e1f2709684a702b81cc5a0a0811570ab589</li>
</ul>
<p>IGTPW_10560: 10560<br />
  IGT_7683: 7683<br />
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad<br />
  xe-648-ed982e1f2709684a702b81cc5a0a0811570ab589: ed982e1f2709684a702b81cc5a0a0811570ab589</p>

</body>
</html>

--===============3471188316654879322==--
