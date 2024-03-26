Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B50CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 22:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31BD10F457;
	Tue, 26 Mar 2024 22:51:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA010F457;
 Tue, 26 Mar 2024 22:51:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8030186047795862082=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fix_memory_access_issue_due_to?=
 =?utf-8?q?_variable_block_scope_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 22:51:07 -0000
Message-ID: <171149346735.1054169.14165301005538081934@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326213937.11750-1-me@petersenna.com>
In-Reply-To: <20240326213937.11750-1-me@petersenna.com>
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

--===============8030186047795862082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix memory access issue due to variable block scope (rev3)
URL   : https://patchwork.freedesktop.org/series/131602/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7785_BAT -> XEIGTPW_10922_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7785 -> IGTPW_10922
  * Linux: xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c -> xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f

  IGTPW_10922: 10922
  IGT_7785: 7785
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c
  xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f: 1750e10841917cd6fb9cb84bec2c0e134cca212f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10922/index.html

--===============8030186047795862082==
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
<tr><td><b>Series:</b></td><td>Fix memory access issue due to variable block scope (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131602/">https://patchwork.freedesktop.org/series/131602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10922/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10922/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7785_BAT -&gt; XEIGTPW_10922_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7785 -&gt; IGTPW_10922</li>
<li>Linux: xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c -&gt; xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f</li>
</ul>
<p>IGTPW_10922: 10922<br />
  IGT_7785: 7785<br />
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c<br />
  xe-997-1750e10841917cd6fb9cb84bec2c0e134cca212f: 1750e10841917cd6fb9cb84bec2c0e134cca212f</p>

</body>
</html>

--===============8030186047795862082==--
