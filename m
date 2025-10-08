Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EEACAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 17:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEDB10E87F;
	Wed,  8 Oct 2025 17:30:11 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B468810E87D;
 Wed,  8 Oct 2025 17:30:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4273943539532529338=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fflip=3A_Suspend?=
 =?utf-8?q?_signal_helper_while_creating_fb?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Oct 2025 17:30:10 -0000
Message-ID: <175994461072.18753.4927836317489945994@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008120329.288455-2-dev@lankhorst.se>
In-Reply-To: <20251008120329.288455-2-dev@lankhorst.se>
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

--===============4273943539532529338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Suspend signal helper while creating fb
URL   : https://patchwork.freedesktop.org/series/155599/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8578_BAT -> XEIGTPW_13873_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8578 -> IGTPW_13873
  * Linux: xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232 -> xe-3886-f929eafc95342ea5377f79705864d50dd325c79f

  IGTPW_13873: 13873
  IGT_8578: fd1f7d868fb6df61db6891ce0bbc8fcd26a0e7ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232: 45c0689519437d48d0de2bff3fbf13ee51012232
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13873/index.html

--===============4273943539532529338==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Suspend signal helper while creating fb</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155599/">https://patchwork.freedesktop.org/series/155599/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13873/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13873/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8578_BAT -&gt; XEIGTPW_13873_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8578 -&gt; IGTPW_13873</li>
<li>Linux: xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232 -&gt; xe-3886-f929eafc95342ea5377f79705864d50dd325c79f</li>
</ul>
<p>IGTPW_13873: 13873<br />
  IGT_8578: fd1f7d868fb6df61db6891ce0bbc8fcd26a0e7ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232: 45c0689519437d48d0de2bff3fbf13ee51012232<br />
  xe-3886-f929eafc95342ea5377f79705864d50dd325c79f: f929eafc95342ea5377f79705864d50dd325c79f</p>

</body>
</html>

--===============4273943539532529338==--
