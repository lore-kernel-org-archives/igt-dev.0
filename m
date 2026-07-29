Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C567FC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 16:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B92310ECE4;
	Wed, 29 Jul 2026 16:16:23 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E6610ECCA;
 Wed, 29 Jul 2026 16:15:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4886571562430030014=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fdebugfs?=
 =?utf-8?q?=3A_add_uc_debugfs_validation_and_read_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jul 2026 16:15:49 -0000
Message-ID: <178534174993.1808.17619191548358103947@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729074130.4499-1-sobin.thomas@intel.com>
In-Reply-To: <20260729074130.4499-1-sobin.thomas@intel.com>
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

--===============4886571562430030014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_debugfs: add uc debugfs validation and read tests
URL   : https://patchwork.freedesktop.org/series/171230/
State : success

== Summary ==

CI Bug Log - changes from IGT_9032 -> IGTPW_15604
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15604/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9032 -> IGTPW_15604
  * Linux: CI_DRM_18917 -> CI_DRM_18918

  CI-20190529: 20190529
  CI_DRM_18917: e0242e84b0b16424381b5a9981a3ee1a4a3786d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18918: 13293e234fec99844f5ff4386553699f72f21e0e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15604: 19f62a86f68cba0b13d604638695c5916d85e374 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9032: 9032

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15604/index.html

--===============4886571562430030014==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_debugfs: add uc debugfs validation and read tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171230/">https://patchwork.freedesktop.org/series/171230/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15604/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15604/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9032 -&gt; IGTPW_15604</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15604/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9032 -&gt; IGTPW_15604</li>
<li>Linux: CI_DRM_18917 -&gt; CI_DRM_18918</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18917: e0242e84b0b16424381b5a9981a3ee1a4a3786d3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18918: 13293e234fec99844f5ff4386553699f72f21e0e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15604: 19f62a86f68cba0b13d604638695c5916d85e374 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9032: 9032</p>

</body>
</html>

--===============4886571562430030014==--
