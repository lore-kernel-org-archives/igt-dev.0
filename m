Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274CCC5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 20:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB9210E587;
	Mon,  2 Jun 2025 20:23:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B9B10E587;
 Mon,  2 Jun 2025 20:23:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8822296179909981259=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/i915/pm=5Frc6=5Fresid?=
 =?utf-8?q?ency=3A_Use_sysfs_to_achieve_peak_frequency_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Jun 2025 20:23:56 -0000
Message-ID: <174889583654.41936.556656999364220171@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602120347.62189-4-sk.anirban@intel.com>
In-Reply-To: <20250602120347.62189-4-sk.anirban@intel.com>
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

--===============8822296179909981259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev5)
URL   : https://patchwork.freedesktop.org/series/148054/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8390_BAT -> XEIGTPW_13225_BAT
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

  * IGT: IGT_8390 -> IGTPW_13225
  * Linux: xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc -> xe-3179-664cb9ddbf975588482c5bbcac821eef66176d3b

  IGTPW_13225: 13225
  IGT_8390: 8390
  xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc: b0d3f3958b8e3136100332939086983195e6a8cc
  xe-3179-664cb9ddbf975588482c5bbcac821eef66176d3b: 664cb9ddbf975588482c5bbcac821eef66176d3b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13225/index.html

--===============8822296179909981259==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13225/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13225/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8390_BAT -&gt; XEIGTPW_13225_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8390 -&gt; IGTPW_13225</li>
<li>Linux: xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc -&gt; xe-3179-664cb9ddbf975588482c5bbcac821eef66176d3b</li>
</ul>
<p>IGTPW_13225: 13225<br />
  IGT_8390: 8390<br />
  xe-3178-b0d3f3958b8e3136100332939086983195e6a8cc: b0d3f3958b8e3136100332939086983195e6a8cc<br />
  xe-3179-664cb9ddbf975588482c5bbcac821eef66176d3b: 664cb9ddbf975588482c5bbcac821eef66176d3b</p>

</body>
</html>

--===============8822296179909981259==--
