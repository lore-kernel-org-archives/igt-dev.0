Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1071C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 19:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3467010E961;
	Mon, 18 Mar 2024 19:17:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59BD10E3A4;
 Mon, 18 Mar 2024 19:17:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3983051461185882604=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_introduce_Xe_multigpu_and_othe?=
 =?utf-8?q?r_multi-GPU_helpers_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Mar 2024 19:17:31 -0000
Message-ID: <171078945167.886689.17589659627061925389@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
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

--===============3983051461185882604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev13)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7769_BAT -> XEIGTPW_10856_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7769 -> IGTPW_10856
  * Linux: xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a -> xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6

  IGTPW_10856: 10856
  IGT_7769: 7769
  xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a: bb2b694350f7d997c90c0edff2d3409d9adc482a
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10856/index.html

--===============3983051461185882604==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10856/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10856/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7769_BAT -&gt; XEIGTPW_10856_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7769 -&gt; IGTPW_10856</li>
<li>Linux: xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a -&gt; xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6</li>
</ul>
<p>IGTPW_10856: 10856<br />
  IGT_7769: 7769<br />
  xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a: bb2b694350f7d997c90c0edff2d3409d9adc482a<br />
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6</p>

</body>
</html>

--===============3983051461185882604==--
