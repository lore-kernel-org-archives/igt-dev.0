Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9ACC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 11:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9D910E85B;
	Wed, 26 Jun 2024 11:41:57 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CE210E85E;
 Wed, 26 Jun 2024 11:41:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7728363286218142474=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib=3A_igt=5Ffb/rendercopy_fix?=
 =?utf-8?q?es/cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jun 2024 11:41:56 -0000
Message-ID: <171940211627.160231.17503046030299097630@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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

--===============7728363286218142474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: igt_fb/rendercopy fixes/cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/135374/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7901_BAT -> XEIGTPW_11317_BAT
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

  * IGT: IGT_7901 -> IGTPW_11317
  * Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -> xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356

  IGTPW_11317: b56ab2c09001989860344057891f856119cde1c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d
  xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356: 4e4d42f54537b821c3aea17ef8b669a36ac09356

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11317/index.html

--===============7728363286218142474==
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
<tr><td><b>Series:</b></td><td>lib: igt_fb/rendercopy fixes/cleanups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135374/">https://patchwork.freedesktop.org/series/135374/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11317/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11317/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7901_BAT -&gt; XEIGTPW_11317_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7901 -&gt; IGTPW_11317</li>
<li>Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -&gt; xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356</li>
</ul>
<p>IGTPW_11317: b56ab2c09001989860344057891f856119cde1c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d<br />
  xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356: 4e4d42f54537b821c3aea17ef8b669a36ac09356</p>

</body>
</html>

--===============7728363286218142474==--
