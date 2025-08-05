Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7134FC87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 06:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892A10E5E0;
	Tue,  5 Aug 2025 06:21:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8161510E5E0;
 Tue,  5 Aug 2025 06:21:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5695192780375400438=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Fix_for_HRR_panels_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Aug 2025 06:21:54 -0000
Message-ID: <175437491452.212486.6303152240767904200@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250801105640.929381-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250801105640.929381-1-santhosh.reddy.guddati@intel.com>
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

--===============5695192780375400438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Fix for HRR panels (rev3)
URL   : https://patchwork.freedesktop.org/series/150130/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8486_BAT -> XEIGTPW_13553_BAT
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

  * IGT: IGT_8486 -> IGTPW_13553
  * Linux: xe-3505-7358407738e36791d7c141decf98622e05b34a01 -> xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b

  IGTPW_13553: 13553
  IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3505-7358407738e36791d7c141decf98622e05b34a01: 7358407738e36791d7c141decf98622e05b34a01
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13553/index.html

--===============5695192780375400438==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Fix for HRR panels (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150130/">https://patchwork.freedesktop.org/series/150130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13553/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13553/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8486_BAT -&gt; XEIGTPW_13553_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8486 -&gt; IGTPW_13553</li>
<li>Linux: xe-3505-7358407738e36791d7c141decf98622e05b34a01 -&gt; xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b</li>
</ul>
<p>IGTPW_13553: 13553<br />
  IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3505-7358407738e36791d7c141decf98622e05b34a01: 7358407738e36791d7c141decf98622e05b34a01<br />
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b</p>

</body>
</html>

--===============5695192780375400438==--
