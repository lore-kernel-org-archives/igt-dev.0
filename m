Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9445C531DC
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 15:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964D310E2A7;
	Tue, 20 Aug 2024 15:39:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A67910E277;
 Tue, 20 Aug 2024 15:39:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2930380881103216094=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/device=5Freset=3A_Requir?=
 =?utf-8?q?e_a_PCI_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Aug 2024 15:39:47 -0000
Message-ID: <172416838722.700411.9853963211909896195@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820144303.140707-1-robdclark@gmail.com>
In-Reply-To: <20240820144303.140707-1-robdclark@gmail.com>
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

--===============2930380881103216094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/device_reset: Require a PCI device
URL   : https://patchwork.freedesktop.org/series/137520/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7979_BAT -> XEIGTPW_11603_BAT
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

  * IGT: IGT_7979 -> IGTPW_11603

  IGTPW_11603: 11603
  IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5: 5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11603/index.html

--===============2930380881103216094==
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
<tr><td><b>Series:</b></td><td>tests/device_reset: Require a PCI device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137520/">https://patchwork.freedesktop.org/series/137520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11603/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11603/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7979_BAT -&gt; XEIGTPW_11603_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7979 -&gt; IGTPW_11603</li>
</ul>
<p>IGTPW_11603: 11603<br />
  IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5: 5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5</p>

</body>
</html>

--===============2930380881103216094==--
