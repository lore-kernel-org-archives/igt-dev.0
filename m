Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0948C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464B910E75D;
	Thu, 29 May 2025 17:23:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87D310E109;
 Thu, 29 May 2025 17:23:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6252915225857033247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/i915/pm=5Frc6=5Fresi?=
 =?utf-8?q?dency=3A_Use_sysfs_to_achieve_peak_frequency_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 May 2025 17:23:45 -0000
Message-ID: <174853942588.32035.7341861429911949896@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529090841.4177513-1-sk.anirban@intel.com>
In-Reply-To: <20250529090841.4177513-1-sk.anirban@intel.com>
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

--===============6252915225857033247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev4)
URL   : https://patchwork.freedesktop.org/series/148054/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8383_FULL -> XEIGTPW_13206_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8383 -> IGTPW_13206
  * Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -> xe-3157-bf0749a9930efe943554c3f73454d03c43779d15

  IGTPW_13206: 0b49229cc7ef6d577ae4afb48a5149a197a8dd43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8383: 8383
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13206/index.html

--===============6252915225857033247==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13206/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13206/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8383_FULL -&gt; XEIGTPW_13206_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8383 -&gt; IGTPW_13206</li>
<li>Linux: xe-3156-2f74377e0846598397723197386e6d9d65b7711e -&gt; xe-3157-bf0749a9930efe943554c3f73454d03c43779d15</li>
</ul>
<p>IGTPW_13206: 0b49229cc7ef6d577ae4afb48a5149a197a8dd43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8383: 8383<br />
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e<br />
  xe-3157-bf0749a9930efe943554c3f73454d03c43779d15: bf0749a9930efe943554c3f73454d03c43779d15</p>

</body>
</html>

--===============6252915225857033247==--
