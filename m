Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B25CD6E4A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 13:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCF811A0BB;
	Thu,  4 Jun 2026 13:50:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7A611A0BB;
 Thu,  4 Jun 2026 13:50:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5833516702054815605=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fchamelium=5Fcol?=
 =?utf-8?q?or=5Fpipeline=3A_Add_plane_color_pipeline_validation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jun 2026 13:50:00 -0000
Message-ID: <178058100076.43442.13187831169697403160@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604123356.2573037-1-swati2.sharma@intel.com>
In-Reply-To: <20260604123356.2573037-1-swati2.sharma@intel.com>
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

--===============5833516702054815605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_chamelium_color_pipeline: Add plane color pipeline validation (rev2)
URL   : https://patchwork.freedesktop.org/series/162563/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8948_BAT -> XEIGTPW_15304_BAT
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

  * IGT: IGT_8948 -> IGTPW_15304
  * Linux: xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9 -> xe-5202-0c0e5863052e1feebbc742ef12ee435a02ecb3a6

  IGTPW_15304: 4f011f6fe7ce09f51e784b1fa06e8a6e47d898b3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8948: 8948
  xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9: b22c3c5987e81692562be2f094eddea94614b7b9
  xe-5202-0c0e5863052e1feebbc742ef12ee435a02ecb3a6: 0c0e5863052e1feebbc742ef12ee435a02ecb3a6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15304/index.html

--===============5833516702054815605==
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
<tr><td><b>Series:</b></td><td>tests/kms_chamelium_color_pipeline: Add plane color pipeline validation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162563/">https://patchwork.freedesktop.org/series/162563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15304/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15304/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8948_BAT -&gt; XEIGTPW_15304_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8948 -&gt; IGTPW_15304</li>
<li>Linux: xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9 -&gt; xe-5202-0c0e5863052e1feebbc742ef12ee435a02ecb3a6</li>
</ul>
<p>IGTPW_15304: 4f011f6fe7ce09f51e784b1fa06e8a6e47d898b3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8948: 8948<br />
  xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9: b22c3c5987e81692562be2f094eddea94614b7b9<br />
  xe-5202-0c0e5863052e1feebbc742ef12ee435a02ecb3a6: 0c0e5863052e1feebbc742ef12ee435a02ecb3a6</p>

</body>
</html>

--===============5833516702054815605==--
