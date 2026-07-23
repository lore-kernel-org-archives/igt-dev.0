Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1F3C531D2
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 14:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F285B10E58E;
	Thu, 23 Jul 2026 14:50:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB0D10E58E;
 Thu, 23 Jul 2026 14:49:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6348561436935009274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_platform-specific_joine?=
 =?utf-8?q?r_exception_mode_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Jul 2026 14:49:42 -0000
Message-ID: <178481818244.221667.11682765795056975497@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723134355.337709-1-sowmiya.s@intel.com>
In-Reply-To: <20260723134355.337709-1-sowmiya.s@intel.com>
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

--===============6348561436935009274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add platform-specific joiner exception mode handling
URL   : https://patchwork.freedesktop.org/series/170996/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9022_BAT -> XEIGTPW_15587_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9022 -> IGTPW_15587

  IGTPW_15587: 10cb29f438d369add31f76dc029341b761b07882 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9022: 9022
  xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15587/index.html

--===============6348561436935009274==
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
<tr><td><b>Series:</b></td><td>Add platform-specific joiner exception mode handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170996/">https://patchwork.freedesktop.org/series/170996/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15587/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15587/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9022_BAT -&gt; XEIGTPW_15587_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9022 -&gt; IGTPW_15587</li>
</ul>
<p>IGTPW_15587: 10cb29f438d369add31f76dc029341b761b07882 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9022: 9022<br />
  xe-5467-2c64192f1ad194a53800f6dd8c779d5b4bbc1831: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831</p>

</body>
</html>

--===============6348561436935009274==--
