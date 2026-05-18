Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540E1CD4F4A
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 23:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4BA10E9CB;
	Mon, 18 May 2026 23:17:39 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6110E9CB;
 Mon, 18 May 2026 23:17:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4177763299237090753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fblt=3A_Replace_?=
 =?utf-8?q?CANONICAL=28=29_with_xe=5Fcanonical=5Fva=28=29_for_Xe_driver_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 May 2026 23:17:20 -0000
Message-ID: <177914624048.83112.12375235439415891518@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260518082113.1275002-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260518082113.1275002-1-dnyaneshwar.bhadane@intel.com>
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

--===============4177763299237090753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_blt: Replace CANONICAL() with xe_canonical_va() for Xe driver (rev2)
URL   : https://patchwork.freedesktop.org/series/166213/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8918_BAT -> XEIGTPW_15196_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8918 -> IGTPW_15196
  * Linux: xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900 -> xe-5087-94e4b8dc66d191ccb11a59ae2c065b5b6f3565d8

  IGTPW_15196: 15196
  IGT_8918: 8918
  xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900: 7161a1ce9e045da82f90b1b4c184ab84b7f54900
  xe-5087-94e4b8dc66d191ccb11a59ae2c065b5b6f3565d8: 94e4b8dc66d191ccb11a59ae2c065b5b6f3565d8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15196/index.html

--===============4177763299237090753==
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
<tr><td><b>Series:</b></td><td>lib/intel_blt: Replace CANONICAL() with xe_canonical_va() for Xe driver (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166213/">https://patchwork.freedesktop.org/series/166213/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15196/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15196/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8918_BAT -&gt; XEIGTPW_15196_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8918 -&gt; IGTPW_15196</li>
<li>Linux: xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900 -&gt; xe-5087-94e4b8dc66d191ccb11a59ae2c065b5b6f3565d8</li>
</ul>
<p>IGTPW_15196: 15196<br />
  IGT_8918: 8918<br />
  xe-5086-7161a1ce9e045da82f90b1b4c184ab84b7f54900: 7161a1ce9e045da82f90b1b4c184ab84b7f54900<br />
  xe-5087-94e4b8dc66d191ccb11a59ae2c065b5b6f3565d8: 94e4b8dc66d191ccb11a59ae2c065b5b6f3565d8</p>

</body>
</html>

--===============4177763299237090753==--
