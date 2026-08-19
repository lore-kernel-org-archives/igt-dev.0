Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7531C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 20:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D42310E0B4;
	Wed, 19 Aug 2026 20:04:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DD710E0B4;
 Wed, 19 Aug 2026 20:04:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9044398048218719447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fexec=5Fpa?=
 =?utf-8?q?rams=3A_add_invalid-offset-multiple-buffers_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Aug 2026 20:04:15 -0000
Message-ID: <178716985541.68440.4685685186009964595@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
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

--===============9044398048218719447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_params: add invalid-offset-multiple-buffers test (rev2)
URL   : https://patchwork.freedesktop.org/series/172083/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9063_BAT -> XEIGTPW_15708_BAT
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

  * IGT: IGT_9063 -> IGTPW_15708
  * Linux: xe-5617-291141d363710c4ac7ef9ab71153459d746ed50c -> xe-5618-b083c821521cb941e9838665d205fe76943a0b66

  IGTPW_15708: 15708
  IGT_9063: 9063
  xe-5617-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c
  xe-5618-b083c821521cb941e9838665d205fe76943a0b66: b083c821521cb941e9838665d205fe76943a0b66

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15708/index.html

--===============9044398048218719447==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_params: add invalid-offset-multiple-buffers test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172083/">https://patchwork.freedesktop.org/series/172083/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15708/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15708/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9063_BAT -&gt; XEIGTPW_15708_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9063 -&gt; IGTPW_15708</li>
<li>Linux: xe-5617-291141d363710c4ac7ef9ab71153459d746ed50c -&gt; xe-5618-b083c821521cb941e9838665d205fe76943a0b66</li>
</ul>
<p>IGTPW_15708: 15708<br />
  IGT_9063: 9063<br />
  xe-5617-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c<br />
  xe-5618-b083c821521cb941e9838665d205fe76943a0b66: b083c821521cb941e9838665d205fe76943a0b66</p>

</body>
</html>

--===============9044398048218719447==--
