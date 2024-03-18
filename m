Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D675C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 19:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3189F10FF3C;
	Mon, 18 Mar 2024 19:59:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D277B10FF3C;
 Mon, 18 Mar 2024 19:59:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2961382566947902028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu=3A_add_fuzzing_te?=
 =?utf-8?q?sts_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Mar 2024 19:59:19 -0000
Message-ID: <171079195986.886732.1980055728660223863@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318184056.108067-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240318184056.108067-1-vitaly.prosyak@amd.com>
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

--===============2961382566947902028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add fuzzing tests (rev3)
URL   : https://patchwork.freedesktop.org/series/131209/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7769_BAT -> XEIGTPW_10857_BAT
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

  * IGT: IGT_7769 -> IGTPW_10857
  * Linux: xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a -> xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6

  IGTPW_10857: 10857
  IGT_7769: 7769
  xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a: bb2b694350f7d997c90c0edff2d3409d9adc482a
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10857/index.html

--===============2961382566947902028==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add fuzzing tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131209/">https://patchwork.freedesktop.org/series/131209/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10857/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10857/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7769_BAT -&gt; XEIGTPW_10857_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7769 -&gt; IGTPW_10857</li>
<li>Linux: xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a -&gt; xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6</li>
</ul>
<p>IGTPW_10857: 10857<br />
  IGT_7769: 7769<br />
  xe-951-bb2b694350f7d997c90c0edff2d3409d9adc482a: bb2b694350f7d997c90c0edff2d3409d9adc482a<br />
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6</p>

</body>
</html>

--===============2961382566947902028==--
