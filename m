Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD0D73EAA
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 01:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12B110E0BA;
	Fri, 30 Jan 2026 01:36:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D301010E0BA;
 Fri, 30 Jan 2026 01:36:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8338965688861444401=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Expect_UC_PAT_madvise_rejection_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Jan 2026 01:36:20 -0000
Message-ID: <176973698086.207489.17078693974156336999@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129003146.340181-1-jia.yao@intel.com>
In-Reply-To: <20260129003146.340181-1-jia.yao@intel.com>
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

--===============8338965688861444401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Expect UC PAT madvise rejection (rev3)
URL   : https://patchwork.freedesktop.org/series/160833/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8725_BAT -> XEIGTPW_14452_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8725 -> IGTPW_14452
  * Linux: xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0 -> xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4

  IGTPW_14452: 14452
  IGT_8725: 8725
  xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0: 7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0
  xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4: d969f98227a64fa88e79933a72018d5d05e5c1b4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14452/index.html

--===============8338965688861444401==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Expect UC PAT madvise rejection (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160833/">https://patchwork.freedesktop.org/series/160833/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14452/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14452/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8725_BAT -&gt; XEIGTPW_14452_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8725 -&gt; IGTPW_14452</li>
<li>Linux: xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0 -&gt; xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4</li>
</ul>
<p>IGTPW_14452: 14452<br />
  IGT_8725: 8725<br />
  xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0: 7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0<br />
  xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4: d969f98227a64fa88e79933a72018d5d05e5c1b4</p>

</body>
</html>

--===============8338965688861444401==--
