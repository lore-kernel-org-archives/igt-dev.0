Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29E7D46BFA
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 20:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C4410E2E2;
	Wed, 28 Jan 2026 20:12:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F0810E2E2;
 Wed, 28 Jan 2026 20:12:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2490057415932683876=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Extend_xe=5Fexec=5Fsystem?=
 =?utf-8?q?=5Fallocator_compute_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jan 2026 20:12:51 -0000
Message-ID: <176963117120.202811.17250912296253163686@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128173412.1319610-1-francois.dugast@intel.com>
In-Reply-To: <20260128173412.1319610-1-francois.dugast@intel.com>
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

--===============2490057415932683876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend xe_exec_system_allocator compute tests
URL   : https://patchwork.freedesktop.org/series/160784/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8723_BAT -> XEIGTPW_14442_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8723 -> IGTPW_14442

  IGTPW_14442: bc07aaf6236d19e6912e8e91eec762611d539fd4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8723: 8723
  xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f: 8059f097e25f736bb3da09af6a9b283079abfd4f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14442/index.html

--===============2490057415932683876==
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
<tr><td><b>Series:</b></td><td>Extend xe_exec_system_allocator compute tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160784/">https://patchwork.freedesktop.org/series/160784/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14442/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14442/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8723_BAT -&gt; XEIGTPW_14442_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8723 -&gt; IGTPW_14442</li>
</ul>
<p>IGTPW_14442: bc07aaf6236d19e6912e8e91eec762611d539fd4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8723: 8723<br />
  xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f: 8059f097e25f736bb3da09af6a9b283079abfd4f</p>

</body>
</html>

--===============2490057415932683876==--
