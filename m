Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66488C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 22:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A99C10E4F2;
	Mon, 14 Jul 2025 22:10:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457BC10E4F2;
 Mon, 14 Jul 2025 22:10:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5462735820104561389=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Skip_PSR_when_disabled_=28r?=
 =?utf-8?q?ev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 14 Jul 2025 22:10:03 -0000
Message-ID: <175253100327.160349.1543923862988545021@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714161802.821516-1-michal.grzelak@intel.com>
In-Reply-To: <20250714161802.821516-1-michal.grzelak@intel.com>
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

--===============5462735820104561389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip PSR when disabled (rev5)
URL   : https://patchwork.freedesktop.org/series/148962/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8457_BAT -> XEIGTPW_13464_BAT
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

  * IGT: IGT_8457 -> IGTPW_13464
  * Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -> xe-3411-9579a27e412210571020a1640bc8a99ed770444d

  IGTPW_13464: 13464
  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822
  xe-3411-9579a27e412210571020a1640bc8a99ed770444d: 9579a27e412210571020a1640bc8a99ed770444d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13464/index.html

--===============5462735820104561389==
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
<tr><td><b>Series:</b></td><td>Skip PSR when disabled (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148962/">https://patchwork.freedesktop.org/series/148962/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13464/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13464/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8457_BAT -&gt; XEIGTPW_13464_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8457 -&gt; IGTPW_13464</li>
<li>Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -&gt; xe-3411-9579a27e412210571020a1640bc8a99ed770444d</li>
</ul>
<p>IGTPW_13464: 13464<br />
  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822<br />
  xe-3411-9579a27e412210571020a1640bc8a99ed770444d: 9579a27e412210571020a1640bc8a99ed770444d</p>

</body>
</html>

--===============5462735820104561389==--
