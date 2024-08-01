Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0DEC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 15:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902BC10E15C;
	Thu,  1 Aug 2024 15:37:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B20B10E15C;
 Thu,  1 Aug 2024 15:37:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4618332300415930694=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_sysfs_node_checks_for_gt?=
 =?utf-8?q?=5Ffreq_and_pm=5Fresidency_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 15:37:19 -0000
Message-ID: <172252663910.488380.15358640269141508652@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
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

--===============4618332300415930694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add sysfs node checks for gt_freq and pm_residency tests
URL   : https://patchwork.freedesktop.org/series/136802/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7950_BAT -> XEIGTPW_11516_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7950 -> IGTPW_11516
  * Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -> xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a

  IGTPW_11516: de49f37570efa660431bbd43d61608c690e92953 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7950: 7950
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/index.html

--===============4618332300415930694==
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
<tr><td><b>Series:</b></td><td>Add sysfs node checks for gt_freq and pm_residency tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136802/">https://patchwork.freedesktop.org/series/136802/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7950_BAT -&gt; XEIGTPW_11516_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7950 -&gt; IGTPW_11516</li>
<li>Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -&gt; xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a</li>
</ul>
<p>IGTPW_11516: de49f37570efa660431bbd43d61608c690e92953 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7950: 7950<br />
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055<br />
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a</p>

</body>
</html>

--===============4618332300415930694==--
