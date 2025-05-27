Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE3C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 22:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0C610E0D0;
	Tue, 27 May 2025 22:01:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9156910E0D0;
 Tue, 27 May 2025 22:01:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0571941306335298919=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_render-node=2C_gt_reset?=
 =?utf-8?q?_and_suspend_engine_activity_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 May 2025 22:01:57 -0000
Message-ID: <174838331758.26063.14525407158119924299@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250527103433.910475-1-riana.tauro@intel.com>
In-Reply-To: <20250527103433.910475-1-riana.tauro@intel.com>
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

--===============0571941306335298919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add render-node, gt reset and suspend engine activity tests
URL   : https://patchwork.freedesktop.org/series/149526/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8380_BAT -> XEIGTPW_13193_BAT
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

  * IGT: IGT_8380 -> IGTPW_13193
  * Linux: xe-3134-bf01fbfe3783179370355420b877619645103cae -> xe-3148-6ffa054d5495d030899b3e4f223ecf9fa1d3a640

  IGTPW_13193: 13193
  IGT_8380: 8380
  xe-3134-bf01fbfe3783179370355420b877619645103cae: bf01fbfe3783179370355420b877619645103cae
  xe-3148-6ffa054d5495d030899b3e4f223ecf9fa1d3a640: 6ffa054d5495d030899b3e4f223ecf9fa1d3a640

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13193/index.html

--===============0571941306335298919==
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
<tr><td><b>Series:</b></td><td>Add render-node, gt reset and suspend engine activity tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149526/">https://patchwork.freedesktop.org/series/149526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13193/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13193/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8380_BAT -&gt; XEIGTPW_13193_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8380 -&gt; IGTPW_13193</li>
<li>Linux: xe-3134-bf01fbfe3783179370355420b877619645103cae -&gt; xe-3148-6ffa054d5495d030899b3e4f223ecf9fa1d3a640</li>
</ul>
<p>IGTPW_13193: 13193<br />
  IGT_8380: 8380<br />
  xe-3134-bf01fbfe3783179370355420b877619645103cae: bf01fbfe3783179370355420b877619645103cae<br />
  xe-3148-6ffa054d5495d030899b3e4f223ecf9fa1d3a640: 6ffa054d5495d030899b3e4f223ecf9fa1d3a640</p>

</body>
</html>

--===============0571941306335298919==--
