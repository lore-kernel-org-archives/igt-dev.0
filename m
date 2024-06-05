Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B88C27C52
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BDE10E15B;
	Wed,  5 Jun 2024 18:58:00 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2FF10E15B;
 Wed,  5 Jun 2024 18:57:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4617065215429973686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe=3A_Use_synchronous_gt_r?=
 =?utf-8?q?esets_when_needed_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Jun 2024 18:57:57 -0000
Message-ID: <171761387789.79.9581786515907267650@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
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

--===============4617065215429973686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe: Use synchronous gt resets when needed (rev4)
URL   : https://patchwork.freedesktop.org/series/134509/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7879_BAT -> XEIGTPW_11226_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 3)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7879 -> IGTPW_11226

  IGTPW_11226: 11226
  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1405-a494545483635d3d93d19e8f483f61e7d4198383: a494545483635d3d93d19e8f483f61e7d4198383

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11226/index.html

--===============4617065215429973686==
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
<tr><td><b>Series:</b></td><td>lib/xe: Use synchronous gt resets when needed (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134509/">https://patchwork.freedesktop.org/series/134509/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11226/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7879_BAT -&gt; XEIGTPW_11226_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 3)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7879 -&gt; IGTPW_11226</li>
</ul>
<p>IGTPW_11226: 11226<br />
  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1405-a494545483635d3d93d19e8f483f61e7d4198383: a494545483635d3d93d19e8f483f61e7d4198383</p>

</body>
</html>

--===============4617065215429973686==--
