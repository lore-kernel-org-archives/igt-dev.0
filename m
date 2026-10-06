Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99506CA5FFC
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 15:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FD710E009;
	Tue,  6 Oct 2026 15:48:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC00D10E009;
 Tue,  6 Oct 2026 15:48:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2748693655732353121=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_Do_?=
 =?utf-8?q?not_enable_VFs_in_unrelated_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Oct 2026 15:48:06 -0000
Message-ID: <179130168676.244586.5717109471603055919@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
In-Reply-To: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
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

--===============2748693655732353121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Do not enable VFs in unrelated subtests
URL   : https://patchwork.freedesktop.org/series/175623/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9131_BAT -> XEIGTPW_15945_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9131 -> IGTPW_15945
  * Linux: xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c -> xe-5897-3100b6dbc84f29cc7b3fcb987eba9b200b30ed85

  IGTPW_15945: 75229fca173b982e9a90b7135e871a08d8b8659e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c: 7db399fbf387d3656d4a43bdc7d9580e3880bc2c
  xe-5897-3100b6dbc84f29cc7b3fcb987eba9b200b30ed85: 3100b6dbc84f29cc7b3fcb987eba9b200b30ed85

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15945/index.html

--===============2748693655732353121==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Do not enable VFs in unrelated subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175623/">https://patchwork.freedesktop.org/series/175623/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15945/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15945/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9131_BAT -&gt; XEIGTPW_15945_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9131 -&gt; IGTPW_15945</li>
<li>Linux: xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c -&gt; xe-5897-3100b6dbc84f29cc7b3fcb987eba9b200b30ed85</li>
</ul>
<p>IGTPW_15945: 75229fca173b982e9a90b7135e871a08d8b8659e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c: 7db399fbf387d3656d4a43bdc7d9580e3880bc2c<br />
  xe-5897-3100b6dbc84f29cc7b3fcb987eba9b200b30ed85: 3100b6dbc84f29cc7b3fcb987eba9b200b30ed85</p>

</body>
</html>

--===============2748693655732353121==--
