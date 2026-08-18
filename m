Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA74C5DF86
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8D288C11;
	Tue, 18 Aug 2026 14:12:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2C788C11;
 Tue, 18 Aug 2026 14:11:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1358225919950261595=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Order_SR-IOV_scheduling_pro?=
 =?utf-8?q?visioning_safely?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Aug 2026 14:11:59 -0000
Message-ID: <178706231964.63590.1283619457239834306@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
In-Reply-To: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

--===============1358225919950261595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Order SR-IOV scheduling provisioning safely
URL   : https://patchwork.freedesktop.org/series/172390/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9059_BAT -> XEIGTPW_15698_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-nvls-2 bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9059 -> IGTPW_15698
  * Linux: xe-5607-24a2127c5f2bce93dbb33cbbee84666272a5e716 -> xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef

  IGTPW_15698: f006191dbda63bfddb4cd2d81e36f7783765981f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5607-24a2127c5f2bce93dbb33cbbee84666272a5e716: 24a2127c5f2bce93dbb33cbbee84666272a5e716
  xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15698/index.html

--===============1358225919950261595==
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
<tr><td><b>Series:</b></td><td>Order SR-IOV scheduling provisioning safely</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172390/">https://patchwork.freedesktop.org/series/172390/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15698/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15698/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9059_BAT -&gt; XEIGTPW_15698_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-nvls-2 bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9059 -&gt; IGTPW_15698</li>
<li>Linux: xe-5607-24a2127c5f2bce93dbb33cbbee84666272a5e716 -&gt; xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef</li>
</ul>
<p>IGTPW_15698: f006191dbda63bfddb4cd2d81e36f7783765981f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5607-24a2127c5f2bce93dbb33cbbee84666272a5e716: 24a2127c5f2bce93dbb33cbbee84666272a5e716<br />
  xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef</p>

</body>
</html>

--===============1358225919950261595==--
