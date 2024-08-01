Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B94C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F83810E07D;
	Thu,  1 Aug 2024 11:02:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1227E10E07D;
 Thu,  1 Aug 2024 11:02:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2457217220243569151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_New_test_to_validate_link-off_?=
 =?utf-8?q?between_active_regions_=28LOBF=29_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 11:02:21 -0000
Message-ID: <172251014106.487293.3066386066128653507@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801061608.2983058-1-jeevan.b@intel.com>
In-Reply-To: <20240801061608.2983058-1-jeevan.b@intel.com>
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

--===============2457217220243569151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New test to validate link-off between active regions (LOBF) (rev9)
URL   : https://patchwork.freedesktop.org/series/135446/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7950_BAT -> XEIGTPW_11512_BAT
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

  * IGT: IGT_7950 -> IGTPW_11512
  * Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -> xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d

  IGTPW_11512: 11512
  IGT_7950: 7950
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11512/index.html

--===============2457217220243569151==
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
<tr><td><b>Series:</b></td><td>New test to validate link-off between active regions (LOBF) (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135446/">https://patchwork.freedesktop.org/series/135446/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11512/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11512/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7950_BAT -&gt; XEIGTPW_11512_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7950 -&gt; IGTPW_11512</li>
<li>Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -&gt; xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d</li>
</ul>
<p>IGTPW_11512: 11512<br />
  IGT_7950: 7950<br />
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055<br />
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d</p>

</body>
</html>

--===============2457217220243569151==--
