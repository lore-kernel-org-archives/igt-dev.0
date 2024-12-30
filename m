Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F68E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 11:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABA310E4A1;
	Mon, 30 Dec 2024 11:52:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A53310E149;
 Mon, 30 Dec 2024 11:52:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6894015707283021926=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Inject_errors_during_xe=5Fguc=5Fct=5Fsend=5Frecv_=26_x?=
 =?utf-8?q?e=5Fguc=5Fmmio=5Fsend=5Frecv?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Dec 2024 11:52:21 -0000
Message-ID: <173555954104.929010.682326218585439724@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
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

--===============6894015707283021926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv
URL   : https://patchwork.freedesktop.org/series/142999/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8172_BAT -> XEIGTPW_12365_BAT
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

  * IGT: IGT_8172 -> IGTPW_12365
  * Linux: xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077 -> xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642

  IGTPW_12365: 3c4e388c0877571776e38513a257dacd5ba1878b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077: d574310669011e7ef8da6d7e17a2938cae06e077
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12365/index.html

--===============6894015707283021926==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv &amp; xe_guc_mmio_send_recv</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142999/">https://patchwork.freedesktop.org/series/142999/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12365/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12365/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8172_BAT -&gt; XEIGTPW_12365_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8172 -&gt; IGTPW_12365</li>
<li>Linux: xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077 -&gt; xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642</li>
</ul>
<p>IGTPW_12365: 3c4e388c0877571776e38513a257dacd5ba1878b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2412-d574310669011e7ef8da6d7e17a2938cae06e077: d574310669011e7ef8da6d7e17a2938cae06e077<br />
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642</p>

</body>
</html>

--===============6894015707283021926==--
