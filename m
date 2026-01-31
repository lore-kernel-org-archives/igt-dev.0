Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D236D46C1D
	for <igt-dev@archiver.kernel.org>; Sat, 31 Jan 2026 00:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969DE10E109;
	Sat, 31 Jan 2026 00:47:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798D10E109;
 Sat, 31 Jan 2026 00:47:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5632241014504770612=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Expect_UC_PAT_madvise_rejection_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 31 Jan 2026 00:47:45 -0000
Message-ID: <176982046554.212410.9261718408486807909@a3b018990fe9>
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

--===============5632241014504770612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Expect UC PAT madvise rejection (rev5)
URL   : https://patchwork.freedesktop.org/series/160833/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8728_BAT -> XEIGTPW_14460_BAT
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

  * IGT: IGT_8728 -> IGTPW_14460
  * Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -> xe-4478-c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79

  IGTPW_14460: 14460
  IGT_8728: 8728
  xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9
  xe-4478-c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79: c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14460/index.html

--===============5632241014504770612==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Expect UC PAT madvise rejection (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160833/">https://patchwork.freedesktop.org/series/160833/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14460/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14460/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8728_BAT -&gt; XEIGTPW_14460_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8728 -&gt; IGTPW_14460</li>
<li>Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -&gt; xe-4478-c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79</li>
</ul>
<p>IGTPW_14460: 14460<br />
  IGT_8728: 8728<br />
  xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9<br />
  xe-4478-c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79: c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79</p>

</body>
</html>

--===============5632241014504770612==--
