Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B92C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 13:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC9410EC0D;
	Fri, 10 May 2024 13:36:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821610EBBF;
 Fri, 10 May 2024 13:36:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2500209424411113200=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fbig=5Ffb=3A_?=
 =?utf-8?q?Fix_width_calculation_while_creating_the_intel_buf_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 May 2024 13:36:40 -0000
Message-ID: <171534820048.2056296.10164254760537163239@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510112650.116711-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240510112650.116711-1-vinod.govindapillai@intel.com>
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

--===============2500209424411113200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_fb: Fix width calculation while creating the intel buf (rev2)
URL   : https://patchwork.freedesktop.org/series/133277/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7846_BAT -> XEIGTPW_11126_BAT
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

  * IGT: IGT_7846 -> IGTPW_11126
  * Linux: xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75 -> xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6

  IGTPW_11126: 11126
  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75: 92f877dd46245e4a44b6d24b5e303b8c03c40c75
  xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6: b885b00e7fc01fc109887d59ce2d1283714b07c6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11126/index.html

--===============2500209424411113200==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_fb: Fix width calculation while creating the intel buf (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133277/">https://patchwork.freedesktop.org/series/133277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11126/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11126/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7846_BAT -&gt; XEIGTPW_11126_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7846 -&gt; IGTPW_11126</li>
<li>Linux: xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75 -&gt; xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6</li>
</ul>
<p>IGTPW_11126: 11126<br />
  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75: 92f877dd46245e4a44b6d24b5e303b8c03c40c75<br />
  xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6: b885b00e7fc01fc109887d59ce2d1283714b07c6</p>

</body>
</html>

--===============2500209424411113200==--
