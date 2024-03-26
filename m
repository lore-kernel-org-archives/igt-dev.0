Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A551C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 03:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87E210E6B7;
	Tue, 26 Mar 2024 03:30:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251410E66F;
 Tue, 26 Mar 2024 03:30:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1092884498131559178=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amd=5Fbasic=3Afix_evicti?=
 =?utf-8?q?on_test_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 03:30:57 -0000
Message-ID: <171142385746.1039216.10529677274741082842@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326023440.2460660-1-jesse.zhang@amd.com>
In-Reply-To: <20240326023440.2460660-1-jesse.zhang@amd.com>
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

--===============1092884498131559178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_basic:fix eviction test failure
URL   : https://patchwork.freedesktop.org/series/131614/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7782_BAT -> XEIGTPW_10912_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-dg2-oem2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7782 -> IGTPW_10912
  * Linux: xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14 -> xe-991-4a8fabcf2f1aadbbb777a94edd01549c2aa95caf

  IGTPW_10912: 10912
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14: d1ecfbbbb194e8f7941bd84f77f7c938b461ce14
  xe-991-4a8fabcf2f1aadbbb777a94edd01549c2aa95caf: 4a8fabcf2f1aadbbb777a94edd01549c2aa95caf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10912/index.html

--===============1092884498131559178==
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
<tr><td><b>Series:</b></td><td>tests/amd_basic:fix eviction test failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131614/">https://patchwork.freedesktop.org/series/131614/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10912/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7782_BAT -&gt; XEIGTPW_10912_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-dg2-oem2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7782 -&gt; IGTPW_10912</li>
<li>Linux: xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14 -&gt; xe-991-4a8fabcf2f1aadbbb777a94edd01549c2aa95caf</li>
</ul>
<p>IGTPW_10912: 10912<br />
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14: d1ecfbbbb194e8f7941bd84f77f7c938b461ce14<br />
  xe-991-4a8fabcf2f1aadbbb777a94edd01549c2aa95caf: 4a8fabcf2f1aadbbb777a94edd01549c2aa95caf</p>

</body>
</html>

--===============1092884498131559178==--
