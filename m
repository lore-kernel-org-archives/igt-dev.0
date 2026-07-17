Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327A3C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68B610E0B7;
	Fri, 17 Jul 2026 07:44:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADBB10E41A;
 Fri, 17 Jul 2026 07:44:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7946835348098953844=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Add_test_to_validate_YUV420_with_DC3CO_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jul 2026 07:44:20 -0000
Message-ID: <178427426080.200381.9848310892530365708@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717035658.857405-1-jeevan.b@intel.com>
In-Reply-To: <20260717035658.857405-1-jeevan.b@intel.com>
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

--===============7946835348098953844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add test to validate YUV420 with DC3CO (rev4)
URL   : https://patchwork.freedesktop.org/series/169908/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9012_BAT -> XEIGTPW_15547_BAT
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

  * IGT: IGT_9012 -> IGTPW_15547

  IGTPW_15547: 15547
  IGT_9012: d94a55886c7eec82a791728d3cc1c4a6aa945281 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5424-22852552aa1b7198931842ddf824af4dd09e2814: 22852552aa1b7198931842ddf824af4dd09e2814

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15547/index.html

--===============7946835348098953844==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add test to validate YUV420 with DC3CO (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169908/">https://patchwork.freedesktop.org/series/169908/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15547/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15547/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9012_BAT -&gt; XEIGTPW_15547_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9012 -&gt; IGTPW_15547</li>
</ul>
<p>IGTPW_15547: 15547<br />
  IGT_9012: d94a55886c7eec82a791728d3cc1c4a6aa945281 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5424-22852552aa1b7198931842ddf824af4dd09e2814: 22852552aa1b7198931842ddf824af4dd09e2814</p>

</body>
</html>

--===============7946835348098953844==--
