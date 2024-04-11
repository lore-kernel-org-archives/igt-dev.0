Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1884BC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 20:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B990C10F1DD;
	Thu, 11 Apr 2024 20:25:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7211C10F1DD;
 Thu, 11 Apr 2024 20:25:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2932784894941773046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/gem=5Fexec=5Fcaptu?=
 =?utf-8?q?re=3A_fix_use_of_igt=5Fallow=5Fhang=28=29_/_igt=5Fdisallow=5Fhang?=
 =?utf-8?q?=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Apr 2024 20:25:41 -0000
Message-ID: <171286714146.1341991.801669889061484160@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240411191934.10368-1-me@petersenna.com>
In-Reply-To: <20240411191934.10368-1-me@petersenna.com>
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

--===============2932784894941773046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_capture: fix use of igt_allow_hang() / igt_disallow_hang()
URL   : https://patchwork.freedesktop.org/series/132330/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7806_BAT -> XEIGTPW_11013_BAT
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

  * IGT: IGT_7806 -> IGTPW_11013
  * Linux: xe-1078-47b56114d9fd714a477581fbba985e0d98053f80 -> xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223

  IGTPW_11013: 11013
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1078-47b56114d9fd714a477581fbba985e0d98053f80: 47b56114d9fd714a477581fbba985e0d98053f80
  xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223: 64a24a7dc774886c660a412a0d12c02f4bfec223

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11013/index.html

--===============2932784894941773046==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_capture: fix use of igt_allow_hang() / igt_disallow_hang()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132330/">https://patchwork.freedesktop.org/series/132330/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11013/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11013/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7806_BAT -&gt; XEIGTPW_11013_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGTPW_11013</li>
<li>Linux: xe-1078-47b56114d9fd714a477581fbba985e0d98053f80 -&gt; xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223</li>
</ul>
<p>IGTPW_11013: 11013<br />
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1078-47b56114d9fd714a477581fbba985e0d98053f80: 47b56114d9fd714a477581fbba985e0d98053f80<br />
  xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223: 64a24a7dc774886c660a412a0d12c02f4bfec223</p>

</body>
</html>

--===============2932784894941773046==--
