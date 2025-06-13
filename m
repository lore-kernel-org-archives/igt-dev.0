Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53444C71135
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 07:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115010E8B6;
	Fri, 13 Jun 2025 07:14:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90CD10E1D1;
 Fri, 13 Jun 2025 07:14:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4584002491120364309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fsetmode=3A_Find?=
 =?utf-8?q?_compatible_mode_for_eDP_before_selecting_default_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jun 2025 07:14:01 -0000
Message-ID: <174979884174.74820.14488334630196064283@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613054848.3279961-1-jeevan.b@intel.com>
In-Reply-To: <20250613054848.3279961-1-jeevan.b@intel.com>
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

--===============4584002491120364309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Find compatible mode for eDP before selecting default mode
URL   : https://patchwork.freedesktop.org/series/150198/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8410_BAT -> XEIGTPW_13288_BAT
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

  * IGT: IGT_8410 -> IGTPW_13288
  * Linux: xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6 -> xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e

  IGTPW_13288: 060036f18278975db0cc8151c8c512c6aa86d825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6
  xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e: 190bbece34ea123c98a27f5692e8ce8e9559200e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13288/index.html

--===============4584002491120364309==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Find compatible mode for eDP before selecting default mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150198/">https://patchwork.freedesktop.org/series/150198/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13288/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13288/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8410_BAT -&gt; XEIGTPW_13288_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8410 -&gt; IGTPW_13288</li>
<li>Linux: xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6 -&gt; xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e</li>
</ul>
<p>IGTPW_13288: 060036f18278975db0cc8151c8c512c6aa86d825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8410: 5826cdbf1cb8f5ec8a42bae33deb6b2b63e59e6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3244-1eb0e9ebd86a603c0d83e641c5e543606d175bc6: 1eb0e9ebd86a603c0d83e641c5e543606d175bc6<br />
  xe-3245-190bbece34ea123c98a27f5692e8ce8e9559200e: 190bbece34ea123c98a27f5692e8ce8e9559200e</p>

</body>
</html>

--===============4584002491120364309==--
