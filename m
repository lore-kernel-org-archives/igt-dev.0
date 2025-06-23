Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0076DC7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 12:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F36F10E13E;
	Mon, 23 Jun 2025 12:26:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ABE10E13E;
 Mon, 23 Jun 2025 12:26:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6012871584267320044=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpm=3A_Enha?=
 =?utf-8?q?nce_vram-d3cold-threshold_test_to_verify_VRAM_self-refresh_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Jun 2025 12:26:13 -0000
Message-ID: <175068157392.100614.15503975097661015262@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250623101940.157923-2-sk.anirban@intel.com>
In-Reply-To: <20250623101940.157923-2-sk.anirban@intel.com>
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

--===============6012871584267320044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm: Enhance vram-d3cold-threshold test to verify VRAM self-refresh (rev2)
URL   : https://patchwork.freedesktop.org/series/149557/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8421_BAT -> XEIGTPW_13335_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8421 -> IGTPW_13335
  * Linux: xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b -> xe-3287-7b754bc155cea643adf525cf6f56a610c131066b

  IGTPW_13335: 52751cf49a7b2c6b17f0e3a0f4d91e2da78d6fc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8421: 8421
  xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b: cc5c19e59842d7e522f9f9f3943efe34943ed70b
  xe-3287-7b754bc155cea643adf525cf6f56a610c131066b: 7b754bc155cea643adf525cf6f56a610c131066b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13335/index.html

--===============6012871584267320044==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm: Enhance vram-d3cold-threshold test to verify VRAM self-refresh (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149557/">https://patchwork.freedesktop.org/series/149557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13335/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13335/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8421_BAT -&gt; XEIGTPW_13335_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8421 -&gt; IGTPW_13335</li>
<li>Linux: xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b -&gt; xe-3287-7b754bc155cea643adf525cf6f56a610c131066b</li>
</ul>
<p>IGTPW_13335: 52751cf49a7b2c6b17f0e3a0f4d91e2da78d6fc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8421: 8421<br />
  xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b: cc5c19e59842d7e522f9f9f3943efe34943ed70b<br />
  xe-3287-7b754bc155cea643adf525cf6f56a610c131066b: 7b754bc155cea643adf525cf6f56a610c131066b</p>

</body>
</html>

--===============6012871584267320044==--
