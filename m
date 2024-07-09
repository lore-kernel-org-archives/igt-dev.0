Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52778C3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 09:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E6E10E4CA;
	Tue,  9 Jul 2024 09:18:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAFE10E4CA;
 Tue,  9 Jul 2024 09:18:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4642393779010401843=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/amdgpu=3A_fix_amd_dispatch?=
 =?utf-8?q?_issue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jul 2024 09:18:48 -0000
Message-ID: <172051672863.85573.8373531666155294877@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709082322.1873739-1-jesse.zhang@amd.com>
In-Reply-To: <20240709082322.1873739-1-jesse.zhang@amd.com>
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

--===============4642393779010401843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: fix amd dispatch issue
URL   : https://patchwork.freedesktop.org/series/135885/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7920_BAT -> XEIGTPW_11384_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7920 -> IGTPW_11384
  * Linux: xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d -> xe-1578-fe74acc80d474524b2da613714a8d1a25adf648c

  IGTPW_11384: 11384
  IGT_7920: 7920
  xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d: 1b010bec39a554cbbd0b51cbf49142e2f218013d
  xe-1578-fe74acc80d474524b2da613714a8d1a25adf648c: fe74acc80d474524b2da613714a8d1a25adf648c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11384/index.html

--===============4642393779010401843==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: fix amd dispatch issue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135885/">https://patchwork.freedesktop.org/series/135885/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11384/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11384/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7920_BAT -&gt; XEIGTPW_11384_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7920 -&gt; IGTPW_11384</li>
<li>Linux: xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d -&gt; xe-1578-fe74acc80d474524b2da613714a8d1a25adf648c</li>
</ul>
<p>IGTPW_11384: 11384<br />
  IGT_7920: 7920<br />
  xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d: 1b010bec39a554cbbd0b51cbf49142e2f218013d<br />
  xe-1578-fe74acc80d474524b2da613714a8d1a25adf648c: fe74acc80d474524b2da613714a8d1a25adf648c</p>

</body>
</html>

--===============4642393779010401843==--
