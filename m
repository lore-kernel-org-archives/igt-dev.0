Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F194EA794E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 00:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C6A10E782;
	Thu,  5 Feb 2026 00:28:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394310E782;
 Thu,  5 Feb 2026 00:28:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6575278358677289432=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Expect_UC_PAT_madvise_rejection_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Feb 2026 00:28:00 -0000
Message-ID: <177025128037.225523.2843725361619411707@a3b018990fe9>
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

--===============6575278358677289432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Expect UC PAT madvise rejection (rev6)
URL   : https://patchwork.freedesktop.org/series/160833/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8737_BAT -> XEIGTPW_14495_BAT
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

  * IGT: IGT_8737 -> IGTPW_14495
  * Linux: xe-4499-766d92ea1d85ed3d5b5b8da4d29fbf1804f327cb -> xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3

  IGTPW_14495: b4c7fb5d51c68a8a983498b90a826d3c33c9e18d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8737: 8737
  xe-4499-766d92ea1d85ed3d5b5b8da4d29fbf1804f327cb: 766d92ea1d85ed3d5b5b8da4d29fbf1804f327cb
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14495/index.html

--===============6575278358677289432==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Expect UC PAT madvise rejection (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160833/">https://patchwork.freedesktop.org/series/160833/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14495/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14495/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8737_BAT -&gt; XEIGTPW_14495_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8737 -&gt; IGTPW_14495</li>
<li>Linux: xe-4499-766d92ea1d85ed3d5b5b8da4d29fbf1804f327cb -&gt; xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3</li>
</ul>
<p>IGTPW_14495: b4c7fb5d51c68a8a983498b90a826d3c33c9e18d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8737: 8737<br />
  xe-4499-766d92ea1d85ed3d5b5b8da4d29fbf1804f327cb: 766d92ea1d85ed3d5b5b8da4d29fbf1804f327cb<br />
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3</p>

</body>
</html>

--===============6575278358677289432==--
