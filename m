Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7BDCA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 02:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B1D10F54B;
	Thu,  1 Oct 2026 02:12:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D8210F54B;
 Thu,  1 Oct 2026 02:11:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3910320746025120166=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ferr=5Finje?=
 =?utf-8?q?ction=3A_Add_Local_Uncorrectable_Error_Injection_Through_LSC_Stor?=
 =?utf-8?q?age_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Oct 2026 02:11:59 -0000
Message-ID: <179082071993.226764.13276662298489788412@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930153755.2447513-5-soham.purkait@intel.com>
In-Reply-To: <20260930153755.2447513-5-soham.purkait@intel.com>
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

--===============3910320746025120166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_err_injection: Add Local Uncorrectable Error Injection Through LSC Storage (rev3)
URL   : https://patchwork.freedesktop.org/series/172987/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9119_BAT -> XEIGTPW_15927_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9119 -> IGTPW_15927
  * Linux: xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02 -> xe-5856-332faa4cbc2e48ba71db4b3f45c981248f089b2d

  IGTPW_15927: 241fe2b59dc4de5489c4b91f5dbe9832b5b20c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9119: 9985dcc24949e018ed6dfde5313846780c4f2d21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02: ca49a4ff83ac55b037d9ef66a17c3000b5127b02
  xe-5856-332faa4cbc2e48ba71db4b3f45c981248f089b2d: 332faa4cbc2e48ba71db4b3f45c981248f089b2d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15927/index.html

--===============3910320746025120166==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_err_injection: Add Local Uncorrectable Error Injection Through LSC Storage (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172987/">https://patchwork.freedesktop.org/series/172987/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15927/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15927/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9119_BAT -&gt; XEIGTPW_15927_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9119 -&gt; IGTPW_15927</li>
<li>Linux: xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02 -&gt; xe-5856-332faa4cbc2e48ba71db4b3f45c981248f089b2d</li>
</ul>
<p>IGTPW_15927: 241fe2b59dc4de5489c4b91f5dbe9832b5b20c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9119: 9985dcc24949e018ed6dfde5313846780c4f2d21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02: ca49a4ff83ac55b037d9ef66a17c3000b5127b02<br />
  xe-5856-332faa4cbc2e48ba71db4b3f45c981248f089b2d: 332faa4cbc2e48ba71db4b3f45c981248f089b2d</p>

</body>
</html>

--===============3910320746025120166==--
