Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC87CC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 09:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC94210E028;
	Thu,  1 Aug 2024 09:56:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF5710E028;
 Thu,  1 Aug 2024 09:56:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3788015933006047832=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel=3A_Add_tests_to_ru?=
 =?utf-8?q?n_suspend_without_display_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 09:56:23 -0000
Message-ID: <172250618312.487009.397748864818766021@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
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

--===============3788015933006047832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add tests to run suspend without display (rev4)
URL   : https://patchwork.freedesktop.org/series/130239/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7950_BAT -> XEIGTPW_11511_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7950 -> IGTPW_11511
  * Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -> xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d

  IGTPW_11511: 11511
  IGT_7950: 7950
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/index.html

--===============3788015933006047832==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add tests to run suspend without display (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130239/">https://patchwork.freedesktop.org/series/130239/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7950_BAT -&gt; XEIGTPW_11511_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7950 -&gt; IGTPW_11511</li>
<li>Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -&gt; xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d</li>
</ul>
<p>IGTPW_11511: 11511<br />
  IGT_7950: 7950<br />
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055<br />
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d</p>

</body>
</html>

--===============3788015933006047832==--
