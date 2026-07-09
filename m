Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234EFC44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 07:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B553E10E59A;
	Thu,  9 Jul 2026 07:23:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA110E59A;
 Thu,  9 Jul 2026 07:22:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7282428860309521027=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Detect_frame_drops_via_page-flip_events?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jul 2026 07:22:40 -0000
Message-ID: <178358176018.168114.565847537152086741@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709050905.4077066-1-jeevan.b@intel.com>
In-Reply-To: <20260709050905.4077066-1-jeevan.b@intel.com>
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

--===============7282428860309521027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Detect frame drops via page-flip events
URL   : https://patchwork.freedesktop.org/series/170050/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8994_BAT -> XEIGTPW_15495_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8994 -> IGTPW_15495
  * Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d -> xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c

  IGTPW_15495: 15495
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: d2b771941e0c8aec7b6648b0c47d81161136944d
  xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c: 031615563ea8f1acce065bea91fe6ce6b0ce965c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15495/index.html

--===============7282428860309521027==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Detect frame drops via page-flip events</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170050/">https://patchwork.freedesktop.org/series/170050/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15495/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15495/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8994_BAT -&gt; XEIGTPW_15495_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8994 -&gt; IGTPW_15495</li>
<li>Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d -&gt; xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c</li>
</ul>
<p>IGTPW_15495: 15495<br />
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: d2b771941e0c8aec7b6648b0c47d81161136944d<br />
  xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c: 031615563ea8f1acce065bea91fe6ce6b0ce965c</p>

</body>
</html>

--===============7282428860309521027==--
