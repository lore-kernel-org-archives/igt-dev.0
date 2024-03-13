Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B9C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 13:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129310F7E9;
	Wed, 13 Mar 2024 13:13:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91FF10F7F3;
 Wed, 13 Mar 2024 13:13:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1058425109112282566=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_common_functions_for_i915_?=
 =?utf-8?q?and_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Mar 2024 13:13:01 -0000
Message-ID: <171033558182.732481.2958312642665982602@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313104520.148338-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240313104520.148338-1-zbigniew.kempczynski@intel.com>
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

--===============1058425109112282566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add common functions for i915 and xe
URL   : https://patchwork.freedesktop.org/series/131069/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7759_BAT -> XEIGTPW_10823_BAT
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

  * IGT: IGT_7759 -> IGTPW_10823
  * Linux: xe-932-8762453258673794e13e4d59cb9df1042b97ba01 -> xe-934-050dddfc65dd66c35a848204141eb9ee289cc6c9

  IGTPW_10823: 10823
  IGT_7759: 7759
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01
  xe-934-050dddfc65dd66c35a848204141eb9ee289cc6c9: 050dddfc65dd66c35a848204141eb9ee289cc6c9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10823/index.html

--===============1058425109112282566==
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
<tr><td><b>Series:</b></td><td>Add common functions for i915 and xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131069/">https://patchwork.freedesktop.org/series/131069/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10823/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10823/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7759_BAT -&gt; XEIGTPW_10823_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7759 -&gt; IGTPW_10823</li>
<li>Linux: xe-932-8762453258673794e13e4d59cb9df1042b97ba01 -&gt; xe-934-050dddfc65dd66c35a848204141eb9ee289cc6c9</li>
</ul>
<p>IGTPW_10823: 10823<br />
  IGT_7759: 7759<br />
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01<br />
  xe-934-050dddfc65dd66c35a848204141eb9ee289cc6c9: 050dddfc65dd66c35a848204141eb9ee289cc6c9</p>

</body>
</html>

--===============1058425109112282566==--
