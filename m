Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8183CD4846
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 01:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF82C10E21A;
	Tue, 12 May 2026 01:48:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFF610E21A;
 Tue, 12 May 2026 01:48:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8340999390822457248=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcontent=5Fprote?=
 =?utf-8?q?ction=3A_Remove_redundant_cleanup_mst?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 01:48:42 -0000
Message-ID: <177855052224.60052.14653505909320349255@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511065331.664260-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260511065331.664260-1-santhosh.reddy.guddati@intel.com>
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

--===============8340999390822457248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Remove redundant cleanup mst
URL   : https://patchwork.freedesktop.org/series/166294/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8903_BAT -> XEIGTPW_15147_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8903 -> IGTPW_15147
  * Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 -> xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795

  IGTPW_15147: 0a69d48303a2f5ff4bf8110e12555f646449339c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: f8ee23694aa6be213355905a78f79bb1b0861565
  xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795: 0ce1c813197dfbe15ff14143da97ec11161e1795

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15147/index.html

--===============8340999390822457248==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Remove redundant cleanup mst</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166294/">https://patchwork.freedesktop.org/series/166294/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15147/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15147/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8903_BAT -&gt; XEIGTPW_15147_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8903 -&gt; IGTPW_15147</li>
<li>Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 -&gt; xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795</li>
</ul>
<p>IGTPW_15147: 0a69d48303a2f5ff4bf8110e12555f646449339c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: f8ee23694aa6be213355905a78f79bb1b0861565<br />
  xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795: 0ce1c813197dfbe15ff14143da97ec11161e1795</p>

</body>
</html>

--===============8340999390822457248==--
