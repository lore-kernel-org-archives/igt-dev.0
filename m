Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359D1FC6172
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 22:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75BF10EDCB;
	Fri, 13 Sep 2024 22:43:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD1410EDCB;
 Fri, 13 Sep 2024 22:43:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2328585206225199477=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fkmod=3A_Rewrite_xe_u?=
 =?utf-8?q?nload_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Sep 2024 22:43:06 -0000
Message-ID: <172626738633.998634.15516877857367367343@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913221555.569699-1-lucas.demarchi@intel.com>
In-Reply-To: <20240913221555.569699-1-lucas.demarchi@intel.com>
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

--===============2328585206225199477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kmod: Rewrite xe unload logic
URL   : https://patchwork.freedesktop.org/series/138676/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8019_BAT -> XEIGTPW_11743_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8019 -> IGTPW_11743
  * Linux: xe-1949-8839c645d7a7d76cbee6f4807984dbd6c77eb543 -> xe-1950-2530827ab017894f2339dd308356366d6e87a72d

  IGTPW_11743: 11743
  IGT_8019: 8019
  xe-1949-8839c645d7a7d76cbee6f4807984dbd6c77eb543: 8839c645d7a7d76cbee6f4807984dbd6c77eb543
  xe-1950-2530827ab017894f2339dd308356366d6e87a72d: 2530827ab017894f2339dd308356366d6e87a72d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11743/index.html

--===============2328585206225199477==
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
<tr><td><b>Series:</b></td><td>lib/igt_kmod: Rewrite xe unload logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138676/">https://patchwork.freedesktop.org/series/138676/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11743/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11743/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8019_BAT -&gt; XEIGTPW_11743_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8019 -&gt; IGTPW_11743</li>
<li>Linux: xe-1949-8839c645d7a7d76cbee6f4807984dbd6c77eb543 -&gt; xe-1950-2530827ab017894f2339dd308356366d6e87a72d</li>
</ul>
<p>IGTPW_11743: 11743<br />
  IGT_8019: 8019<br />
  xe-1949-8839c645d7a7d76cbee6f4807984dbd6c77eb543: 8839c645d7a7d76cbee6f4807984dbd6c77eb543<br />
  xe-1950-2530827ab017894f2339dd308356366d6e87a72d: 2530827ab017894f2339dd308356366d6e87a72d</p>

</body>
</html>

--===============2328585206225199477==--
