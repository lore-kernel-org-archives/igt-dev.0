Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E44CD98D2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 01:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83E10ED62;
	Wed, 17 Jun 2026 01:52:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A98010ED62;
 Wed, 17 Jun 2026 01:52:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6995221432837282776=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Frpm?=
 =?utf-8?q?=3A_Test_video_playback_across_suspend/resume_cycle?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Jun 2026 01:52:23 -0000
Message-ID: <178166114303.86642.14988741448337382737@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616210109.21172-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260616210109.21172-1-mohammed.thasleem@intel.com>
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

--===============6995221432837282776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_rpm: Test video playback across suspend/resume cycle
URL   : https://patchwork.freedesktop.org/series/168635/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8967_BAT -> XEIGTPW_15384_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8967 -> IGTPW_15384

  IGTPW_15384: 15384
  IGT_8967: 46e60a541c8ce6e4e0046bb68fc577c4b502e5f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5269-29ea43790111df065ed84e6cb076c64322c306f1: 29ea43790111df065ed84e6cb076c64322c306f1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15384/index.html

--===============6995221432837282776==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_rpm: Test video playback across suspend/resume cycle</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168635/">https://patchwork.freedesktop.org/series/168635/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15384/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15384/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8967_BAT -&gt; XEIGTPW_15384_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8967 -&gt; IGTPW_15384</li>
</ul>
<p>IGTPW_15384: 15384<br />
  IGT_8967: 46e60a541c8ce6e4e0046bb68fc577c4b502e5f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5269-29ea43790111df065ed84e6cb076c64322c306f1: 29ea43790111df065ed84e6cb076c64322c306f1</p>

</body>
</html>

--===============6995221432837282776==--
