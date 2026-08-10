Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486B2C5AD55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 14:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11B10E900;
	Mon, 10 Aug 2026 14:49:04 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AF110E8DB;
 Mon, 10 Aug 2026 14:48:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3661598272111863803=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_kms=5Fdp=5Flinktrain=5Ffall?=
 =?utf-8?q?back=3A_Add_UHBR-to-HBR_fallback_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Aug 2026 14:48:21 -0000
Message-ID: <178637330160.35122.1298271491607111847@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810133212.829168-1-sowmiya.s@intel.com>
In-Reply-To: <20260810133212.829168-1-sowmiya.s@intel.com>
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

--===============3661598272111863803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/171645/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9047_BAT -> XEIGTPW_15648_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 12)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9047 -> IGTPW_15648
  * Linux: xe-5562-2fb212a145eaedc46c59605710573661f6ab1d70 -> xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79

  IGTPW_15648: 15648
  IGT_9047: 9047
  xe-5562-2fb212a145eaedc46c59605710573661f6ab1d70: 2fb212a145eaedc46c59605710573661f6ab1d70
  xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79: b241fb2563d63b4781896701a88b25cbc21c6c79

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15648/index.html

--===============3661598272111863803==
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
<tr><td><b>Series:</b></td><td>kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171645/">https://patchwork.freedesktop.org/series/171645/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15648/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15648/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9047_BAT -&gt; XEIGTPW_15648_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 12)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9047 -&gt; IGTPW_15648</li>
<li>Linux: xe-5562-2fb212a145eaedc46c59605710573661f6ab1d70 -&gt; xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79</li>
</ul>
<p>IGTPW_15648: 15648<br />
  IGT_9047: 9047<br />
  xe-5562-2fb212a145eaedc46c59605710573661f6ab1d70: 2fb212a145eaedc46c59605710573661f6ab1d70<br />
  xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79: b241fb2563d63b4781896701a88b25cbc21c6c79</p>

</body>
</html>

--===============3661598272111863803==--
