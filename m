Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B9C25B7C
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 18:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D270110E0BF;
	Tue, 28 May 2024 18:54:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0410E0BF;
 Tue, 28 May 2024 18:54:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5780171712425395987=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc=3A_A?=
 =?utf-8?q?dd_a_new_test_to_validate_the_deep_sleep_state_during_extended_vb?=
 =?utf-8?q?lank_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 May 2024 18:54:45 -0000
Message-ID: <171692248510.2217197.5509262096317623831@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528100944.561032-1-jeevan.b@intel.com>
In-Reply-To: <20240528100944.561032-1-jeevan.b@intel.com>
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

--===============5780171712425395987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add a new test to validate the deep sleep state during extended vblank (rev4)
URL   : https://patchwork.freedesktop.org/series/134058/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7873_BAT -> XEIGTPW_11202_BAT
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

  * IGT: IGT_7873 -> IGTPW_11202

  IGTPW_11202: 11202
  IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1353-abaeae202dfb4e361edd660a124e22178340725d: abaeae202dfb4e361edd660a124e22178340725d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11202/index.html

--===============5780171712425395987==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add a new test to validate the deep sleep state during extended vblank (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134058/">https://patchwork.freedesktop.org/series/134058/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11202/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7873_BAT -&gt; XEIGTPW_11202_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7873 -&gt; IGTPW_11202</li>
</ul>
<p>IGTPW_11202: 11202<br />
  IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1353-abaeae202dfb4e361edd660a124e22178340725d: abaeae202dfb4e361edd660a124e22178340725d</p>

</body>
</html>

--===============5780171712425395987==--
