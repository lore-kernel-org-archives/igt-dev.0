Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1DDCD8CB2
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 18:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ECC10E389;
	Tue,  9 Jun 2026 18:46:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C7E10E389;
 Tue,  9 Jun 2026 18:45:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5886564894121536736=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fexec=5Freset=3A_?=
 =?utf-8?q?Replace_fixed_usleep_with_dynamic_GT_idle_wait_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jun 2026 18:45:39 -0000
Message-ID: <178103073961.60453.11791639880897010832@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609162501.2182610-1-x.wang@intel.com>
In-Reply-To: <20260609162501.2182610-1-x.wang@intel.com>
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

--===============5886564894121536736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_reset: Replace fixed usleep with dynamic GT idle wait (rev2)
URL   : https://patchwork.freedesktop.org/series/168132/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8956_BAT -> XEIGTPW_15333_BAT
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

  * IGT: IGT_8956 -> IGTPW_15333
  * Linux: xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864 -> xe-5226-7d1377c79fa96091b8cc08fef31438a3a2f63908

  IGTPW_15333: 88964437c4428715a6065f3a48f1332cf53335dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8956: 8956
  xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864: 1e8798282ef0590ad21ca33d80e225208d9c7864
  xe-5226-7d1377c79fa96091b8cc08fef31438a3a2f63908: 7d1377c79fa96091b8cc08fef31438a3a2f63908

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15333/index.html

--===============5886564894121536736==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_reset: Replace fixed usleep with dynamic GT idle wait (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168132/">https://patchwork.freedesktop.org/series/168132/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15333/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15333/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8956_BAT -&gt; XEIGTPW_15333_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8956 -&gt; IGTPW_15333</li>
<li>Linux: xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864 -&gt; xe-5226-7d1377c79fa96091b8cc08fef31438a3a2f63908</li>
</ul>
<p>IGTPW_15333: 88964437c4428715a6065f3a48f1332cf53335dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8956: 8956<br />
  xe-5225-1e8798282ef0590ad21ca33d80e225208d9c7864: 1e8798282ef0590ad21ca33d80e225208d9c7864<br />
  xe-5226-7d1377c79fa96091b8cc08fef31438a3a2f63908: 7d1377c79fa96091b8cc08fef31438a3a2f63908</p>

</body>
</html>

--===============5886564894121536736==--
