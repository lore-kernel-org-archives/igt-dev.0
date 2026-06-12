Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FFFCD98CC
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 01:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B12E10E8FF;
	Fri, 12 Jun 2026 01:44:40 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F6010E8FF;
 Fri, 12 Jun 2026 01:44:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8258286662351862029=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fres?=
 =?utf-8?q?et=3A_skip_compression_subtests_early_in_main_thread?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Jun 2026 01:44:17 -0000
Message-ID: <178122865748.71671.11750156287352015199@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612004911.2003505-1-shuicheng.lin@intel.com>
In-Reply-To: <20260612004911.2003505-1-shuicheng.lin@intel.com>
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

--===============8258286662351862029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_reset: skip compression subtests early in main thread
URL   : https://patchwork.freedesktop.org/series/168390/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8960_BAT -> XEIGTPW_15353_BAT
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

  * IGT: IGT_8960 -> IGTPW_15353
  * Linux: xe-5244-311cbada9202146752938f54503d33980ee4f3f6 -> xe-5245-d931e7b381f9d86766f3a971a9376e4312745af8

  IGTPW_15353: 15353
  IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5244-311cbada9202146752938f54503d33980ee4f3f6: 311cbada9202146752938f54503d33980ee4f3f6
  xe-5245-d931e7b381f9d86766f3a971a9376e4312745af8: d931e7b381f9d86766f3a971a9376e4312745af8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15353/index.html

--===============8258286662351862029==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_reset: skip compression subtests early in main thread</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168390/">https://patchwork.freedesktop.org/series/168390/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15353/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15353/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8960_BAT -&gt; XEIGTPW_15353_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8960 -&gt; IGTPW_15353</li>
<li>Linux: xe-5244-311cbada9202146752938f54503d33980ee4f3f6 -&gt; xe-5245-d931e7b381f9d86766f3a971a9376e4312745af8</li>
</ul>
<p>IGTPW_15353: 15353<br />
  IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5244-311cbada9202146752938f54503d33980ee4f3f6: 311cbada9202146752938f54503d33980ee4f3f6<br />
  xe-5245-d931e7b381f9d86766f3a971a9376e4312745af8: d931e7b381f9d86766f3a971a9376e4312745af8</p>

</body>
</html>

--===============8258286662351862029==--
