Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0302EC44520
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 01:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEB010E240;
	Tue, 21 Jul 2026 01:47:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370CB10E240;
 Tue, 21 Jul 2026 01:46:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2066097253446785587=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/amdgpu/amd=5Fdeadlock=3A_add_gfx_user-queue_cle?=
 =?utf-8?q?an-hang_reset_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jul 2026 01:46:39 -0000
Message-ID: <178459839921.209012.15195103898687593954@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720095555.1537413-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260720095555.1537413-1-Jesse.Zhang@amd.com>
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

--===============2066097253446785587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test
URL   : https://patchwork.freedesktop.org/series/170728/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9015_BAT -> XEIGTPW_15563_BAT
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

  * IGT: IGT_9015 -> IGTPW_15563

  IGTPW_15563: 15563
  IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15563/index.html

--===============2066097253446785587==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170728/">https://patchwork.freedesktop.org/series/170728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15563/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15563/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9015_BAT -&gt; XEIGTPW_15563_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9015 -&gt; IGTPW_15563</li>
</ul>
<p>IGTPW_15563: 15563<br />
  IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405</p>

</body>
</html>

--===============2066097253446785587==--
