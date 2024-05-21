Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC1C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 14:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE1C10E053;
	Tue, 21 May 2024 14:49:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C044910E053;
 Tue, 21 May 2024 14:49:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6063406409904740695=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fplane=5Fscaling=3A?=
 =?utf-8?q?_reduce_unnecessary_work?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 May 2024 14:49:17 -0000
Message-ID: <171630295778.2162685.1852303429094535348@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521123041.1119357-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240521123041.1119357-1-juhapekka.heikkila@gmail.com>
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

--===============6063406409904740695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: reduce unnecessary work
URL   : https://patchwork.freedesktop.org/series/133878/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7865_BAT -> XEIGTPW_11170_BAT
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

  * IGT: IGT_7865 -> IGTPW_11170

  IGTPW_11170: e722d91b693d8fff0e074327fdef731ef05644fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7865: 3578243d16f1ea5055f7baa0b1fe7f520538c4ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1314-eaa059c9aa97ac2493cb2547c81962abdfab2176: eaa059c9aa97ac2493cb2547c81962abdfab2176

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11170/index.html

--===============6063406409904740695==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: reduce unnecessary work</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133878/">https://patchwork.freedesktop.org/series/133878/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11170/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11170/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7865_BAT -&gt; XEIGTPW_11170_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7865 -&gt; IGTPW_11170</li>
</ul>
<p>IGTPW_11170: e722d91b693d8fff0e074327fdef731ef05644fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7865: 3578243d16f1ea5055f7baa0b1fe7f520538c4ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1314-eaa059c9aa97ac2493cb2547c81962abdfab2176: eaa059c9aa97ac2493cb2547c81962abdfab2176</p>

</body>
</html>

--===============6063406409904740695==--
