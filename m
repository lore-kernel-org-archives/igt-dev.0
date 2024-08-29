Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C887CC83F05
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 11:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A24E10E637;
	Thu, 29 Aug 2024 11:12:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1510F10E62C;
 Thu, 29 Aug 2024 11:12:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4217356739367853321=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amd=5Fqueue=5Freset=3A_f?=
 =?utf-8?q?ix_critical_warning_in_queue_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Aug 2024 11:12:10 -0000
Message-ID: <172492993005.831099.213417685429542515@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829091727.192798-1-jesse.zhang@amd.com>
In-Reply-To: <20240829091727.192798-1-jesse.zhang@amd.com>
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

--===============4217356739367853321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_queue_reset: fix critical warning in queue reset
URL   : https://patchwork.freedesktop.org/series/137952/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7997_BAT -> XEIGTPW_11663_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7997 -> IGTPW_11663
  * Linux: xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17 -> xe-1854-611af3e98d9594a74d7882bd470822b6009d8061

  IGTPW_11663: 11663
  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17
  xe-1854-611af3e98d9594a74d7882bd470822b6009d8061: 611af3e98d9594a74d7882bd470822b6009d8061

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11663/index.html

--===============4217356739367853321==
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
<tr><td><b>Series:</b></td><td>tests/amd_queue_reset: fix critical warning in queue reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137952/">https://patchwork.freedesktop.org/series/137952/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11663/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11663/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7997_BAT -&gt; XEIGTPW_11663_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7997 -&gt; IGTPW_11663</li>
<li>Linux: xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17 -&gt; xe-1854-611af3e98d9594a74d7882bd470822b6009d8061</li>
</ul>
<p>IGTPW_11663: 11663<br />
  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17<br />
  xe-1854-611af3e98d9594a74d7882bd470822b6009d8061: 611af3e98d9594a74d7882bd470822b6009d8061</p>

</body>
</html>

--===============4217356739367853321==--
