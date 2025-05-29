Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62BFC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 20:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0010E1B0;
	Thu, 29 May 2025 20:02:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B5910E1B0;
 Thu, 29 May 2025 20:02:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0571891967990145489=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Extend_IGT_to_support_Andro?=
 =?utf-8?q?id_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevaka Prabu Badrappan" <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 May 2025 20:02:01 -0000
Message-ID: <174854892135.32355.11075536469393987145@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
In-Reply-To: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
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

--===============0571891967990145489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend IGT to support Android (rev11)
URL   : https://patchwork.freedesktop.org/series/148432/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8384_BAT -> XEIGTPW_13214_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8384 -> IGTPW_13214
  * Linux: xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f -> xe-3161-901190a062301f01d432d9cf164a6b013df3e745

  IGTPW_13214: 13214
  IGT_8384: 8384
  xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f: fa1643bc73a08623ea7f1497258298b0d16a629f
  xe-3161-901190a062301f01d432d9cf164a6b013df3e745: 901190a062301f01d432d9cf164a6b013df3e745

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13214/index.html

--===============0571891967990145489==
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
<tr><td><b>Series:</b></td><td>Extend IGT to support Android (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148432/">https://patchwork.freedesktop.org/series/148432/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13214/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13214/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8384_BAT -&gt; XEIGTPW_13214_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8384 -&gt; IGTPW_13214</li>
<li>Linux: xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f -&gt; xe-3161-901190a062301f01d432d9cf164a6b013df3e745</li>
</ul>
<p>IGTPW_13214: 13214<br />
  IGT_8384: 8384<br />
  xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f: fa1643bc73a08623ea7f1497258298b0d16a629f<br />
  xe-3161-901190a062301f01d432d9cf164a6b013df3e745: 901190a062301f01d432d9cf164a6b013df3e745</p>

</body>
</html>

--===============0571891967990145489==--
