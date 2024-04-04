Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6E8CD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 11:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9468311B4FF;
	Thu,  4 Apr 2024 11:55:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37F11B4FA;
 Thu,  4 Apr 2024 11:55:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2361791416089596870=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fcompute=5Fpre?=
 =?utf-8?q?empt=3A_Run_it_on_only_CCS_engine?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Apr 2024 11:55:51 -0000
Message-ID: <171223175169.1209579.4497358139282851871@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404102901.18803-1-nirmoy.das@intel.com>
In-Reply-To: <20240404102901.18803-1-nirmoy.das@intel.com>
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

--===============2361791416089596870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute_preempt: Run it on only CCS engine
URL   : https://patchwork.freedesktop.org/series/132026/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7798_BAT -> XEIGTPW_10976_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7798 -> IGTPW_10976
  * Linux: xe-1033-406e10d886a22211d2866bfa9322aec1727171f8 -> xe-1034-714417be4833696db248e963e5010e6639610bda

  IGTPW_10976: 10976
  IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1033-406e10d886a22211d2866bfa9322aec1727171f8: 406e10d886a22211d2866bfa9322aec1727171f8
  xe-1034-714417be4833696db248e963e5010e6639610bda: 714417be4833696db248e963e5010e6639610bda

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10976/index.html

--===============2361791416089596870==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute_preempt: Run it on only CCS engine</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132026/">https://patchwork.freedesktop.org/series/132026/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10976/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10976/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7798_BAT -&gt; XEIGTPW_10976_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7798 -&gt; IGTPW_10976</li>
<li>Linux: xe-1033-406e10d886a22211d2866bfa9322aec1727171f8 -&gt; xe-1034-714417be4833696db248e963e5010e6639610bda</li>
</ul>
<p>IGTPW_10976: 10976<br />
  IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1033-406e10d886a22211d2866bfa9322aec1727171f8: 406e10d886a22211d2866bfa9322aec1727171f8<br />
  xe-1034-714417be4833696db248e963e5010e6639610bda: 714417be4833696db248e963e5010e6639610bda</p>

</body>
</html>

--===============2361791416089596870==--
