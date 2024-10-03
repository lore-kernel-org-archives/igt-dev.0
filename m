Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D0CF8573
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 10:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BEA10E0E2;
	Thu,  3 Oct 2024 10:17:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B32D10E0E2;
 Thu,  3 Oct 2024 10:17:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2675203040718774805=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fasync=5Fflips=3A_A?=
 =?utf-8?q?sync_flips_suspend_resume_test_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Oct 2024 10:17:57 -0000
Message-ID: <172795067723.1167361.7145987869749595248@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003094710.2650821-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241003094710.2650821-1-santhosh.reddy.guddati@intel.com>
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

--===============2675203040718774805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Async flips suspend resume test (rev7)
URL   : https://patchwork.freedesktop.org/series/138302/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8050_BAT -> XEIGTPW_11862_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8050 -> IGTPW_11862
  * Linux: xe-2007-789d5631453c3edad1988cd47db1643555e52ac9 -> xe-2010-af143300756485947a455fe84414adb35904c230

  IGTPW_11862: 11862
  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2007-789d5631453c3edad1988cd47db1643555e52ac9: 789d5631453c3edad1988cd47db1643555e52ac9
  xe-2010-af143300756485947a455fe84414adb35904c230: af143300756485947a455fe84414adb35904c230

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11862/index.html

--===============2675203040718774805==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Async flips suspend resume test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138302/">https://patchwork.freedesktop.org/series/138302/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11862/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11862/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8050_BAT -&gt; XEIGTPW_11862_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8050 -&gt; IGTPW_11862</li>
<li>Linux: xe-2007-789d5631453c3edad1988cd47db1643555e52ac9 -&gt; xe-2010-af143300756485947a455fe84414adb35904c230</li>
</ul>
<p>IGTPW_11862: 11862<br />
  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2007-789d5631453c3edad1988cd47db1643555e52ac9: 789d5631453c3edad1988cd47db1643555e52ac9<br />
  xe-2010-af143300756485947a455fe84414adb35904c230: af143300756485947a455fe84414adb35904c230</p>

</body>
</html>

--===============2675203040718774805==--
