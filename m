Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A924C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 11:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3210E168;
	Thu,  3 Jul 2025 11:03:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3CE10E168;
 Thu,  3 Jul 2025 11:03:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8187398719890505595=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=5Fscaling?=
 =?utf-8?q?=3A_Skip_scalar2_downscale_tests_on_Intel_Gen14+_with_specific_co?=
 =?utf-8?q?nditions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Jul 2025 11:03:30 -0000
Message-ID: <175154061029.131301.2265885409464642575@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703060353.74819-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250703060353.74819-1-ramanaidu.naladala@intel.com>
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

--===============8187398719890505595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Skip scalar2 downscale tests on Intel Gen14+ with specific conditions
URL   : https://patchwork.freedesktop.org/series/151104/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8436_BAT -> XEIGTPW_13392_BAT
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

  * IGT: IGT_8436 -> IGTPW_13392

  IGTPW_13392: 1c7ff60faa81cdae0575d7a908eb8e6d8d944400 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8436: 3b7595f0e7f95de6d79e7ae6bb72e86b0a08a08c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407: d04a54cd3b99001adbc4cd3305b44f9f3e658407

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13392/index.html

--===============8187398719890505595==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Skip scalar2 downscale tests on Intel Gen14+ with specific conditions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151104/">https://patchwork.freedesktop.org/series/151104/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13392/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13392/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8436_BAT -&gt; XEIGTPW_13392_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8436 -&gt; IGTPW_13392</li>
</ul>
<p>IGTPW_13392: 1c7ff60faa81cdae0575d7a908eb8e6d8d944400 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8436: 3b7595f0e7f95de6d79e7ae6bb72e86b0a08a08c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407: d04a54cd3b99001adbc4cd3305b44f9f3e658407</p>

</body>
</html>

--===============8187398719890505595==--
