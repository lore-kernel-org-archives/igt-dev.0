Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37691C47DB3
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 11:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC35811342E;
	Wed, 31 Jan 2024 11:29:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2AC11342E;
 Wed, 31 Jan 2024 11:29:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1364352660077350939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fill_block-copy_test_gap_for_u?=
 =?utf-8?q?naligned_sizes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 31 Jan 2024 11:29:47 -0000
Message-ID: <170670058731.860541.11652686428624373228@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
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

--===============1364352660077350939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fill block-copy test gap for unaligned sizes
URL   : https://patchwork.freedesktop.org/series/129362/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10610_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7699 -> IGTPW_10610
  * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101

  IGTPW_10610: 10610
  IGT_7699: 7699
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457
  xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101: 3d244fce99b65e012c4409d8a22bb9168c41f101

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10610/index.html

--===============1364352660077350939==
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
<tr><td><b>Series:</b></td><td>Fill block-copy test gap for unaligned sizes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129362/">https://patchwork.freedesktop.org/series/129362/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10610/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10610/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7699_BAT -&gt; XEIGTPW_10610_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7699 -&gt; IGTPW_10610</li>
<li>Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -&gt; xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101</li>
</ul>
<p>IGTPW_10610: 10610<br />
  IGT_7699: 7699<br />
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457<br />
  xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101: 3d244fce99b65e012c4409d8a22bb9168c41f101</p>

</body>
</html>

--===============1364352660077350939==--
