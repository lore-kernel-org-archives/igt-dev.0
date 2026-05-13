Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EC5CD4F21
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 18:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ED510EFBD;
	Wed, 13 May 2026 18:30:17 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E984B10EFBD;
 Wed, 13 May 2026 18:29:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4592210615651477816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_Use_available_engine_for_ctx-restore_subtests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 May 2026 18:29:59 -0000
Message-ID: <177869699994.69472.8646026517989549629@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260513152415.187654-2-nitin.r.gote@intel.com>
In-Reply-To: <20260513152415.187654-2-nitin.r.gote@intel.com>
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

--===============4592210615651477816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: Use available engine for ctx-restore subtests (rev5)
URL   : https://patchwork.freedesktop.org/series/165238/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8909_BAT -> XEIGTPW_15180_BAT
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

  * IGT: IGT_8909 -> IGTPW_15180
  * Linux: xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 -> xe-5058-21b42374be17d486baf9392b56377afde67a778d

  IGTPW_15180: a36bb9dc5dce1b540b60c620fc484240cfcc84f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4: 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4
  xe-5058-21b42374be17d486baf9392b56377afde67a778d: 21b42374be17d486baf9392b56377afde67a778d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15180/index.html

--===============4592210615651477816==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: Use available engine for ctx-restore subtests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165238/">https://patchwork.freedesktop.org/series/165238/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15180/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15180/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8909_BAT -&gt; XEIGTPW_15180_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8909 -&gt; IGTPW_15180</li>
<li>Linux: xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 -&gt; xe-5058-21b42374be17d486baf9392b56377afde67a778d</li>
</ul>
<p>IGTPW_15180: a36bb9dc5dce1b540b60c620fc484240cfcc84f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8909: e68d82b442e3909dd053c97542aeb029707124cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5053-8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4: 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4<br />
  xe-5058-21b42374be17d486baf9392b56377afde67a778d: 21b42374be17d486baf9392b56377afde67a778d</p>

</body>
</html>

--===============4592210615651477816==--
