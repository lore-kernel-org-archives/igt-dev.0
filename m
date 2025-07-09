Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C6EC83F09
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 05:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD30D10E717;
	Wed,  9 Jul 2025 05:35:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5095110E717;
 Wed,  9 Jul 2025 05:35:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0807735726900979326=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Look?=
 =?utf-8?q?_at_errno_only_when_system_calls_fail_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 09 Jul 2025 05:35:37 -0000
Message-ID: <175203933732.146266.14748284466074603619@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708151659.3556357-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250708151659.3556357-1-ashutosh.dixit@intel.com>
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

--===============0807735726900979326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Look at errno only when system calls fail (rev2)
URL   : https://patchwork.freedesktop.org/series/151344/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8447_BAT -> XEIGTPW_13437_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8447 -> IGTPW_13437
  * Linux: xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99 -> xe-3377-b56a996bf200253fd2df3518cb46613e37090e48

  IGTPW_13437: ae625c536f3693723ec0ea25cd956a07bf6eab02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8447: 8447
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99
  xe-3377-b56a996bf200253fd2df3518cb46613e37090e48: b56a996bf200253fd2df3518cb46613e37090e48

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13437/index.html

--===============0807735726900979326==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Look at errno only when system calls fail (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151344/">https://patchwork.freedesktop.org/series/151344/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13437/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13437/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8447_BAT -&gt; XEIGTPW_13437_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGTPW_13437</li>
<li>Linux: xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99 -&gt; xe-3377-b56a996bf200253fd2df3518cb46613e37090e48</li>
</ul>
<p>IGTPW_13437: ae625c536f3693723ec0ea25cd956a07bf6eab02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8447: 8447<br />
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99<br />
  xe-3377-b56a996bf200253fd2df3518cb46613e37090e48: b56a996bf200253fd2df3518cb46613e37090e48</p>

</body>
</html>

--===============0807735726900979326==--
