Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2811C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09C10E30C;
	Thu, 29 May 2025 06:57:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221610E30C;
 Thu, 29 May 2025 06:57:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3651927930430821829=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_whitelist_for_HDCP_panels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 May 2025 06:57:11 -0000
Message-ID: <174850183197.31204.16384038255302376234@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
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

--===============3651927930430821829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: whitelist for HDCP panels
URL   : https://patchwork.freedesktop.org/series/149614/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8382_FULL -> XEIGTPW_13203_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8382 -> IGTPW_13203
  * Linux: xe-3154-a1af1c0af1b870eab1359766073e7086833c8323 -> xe-3156-2f74377e0846598397723197386e6d9d65b7711e

  IGTPW_13203: 13203
  IGT_8382: 8382
  xe-3154-a1af1c0af1b870eab1359766073e7086833c8323: a1af1c0af1b870eab1359766073e7086833c8323
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13203/index.html

--===============3651927930430821829==
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
<tr><td><b>Series:</b></td><td>whitelist for HDCP panels</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149614/">https://patchwork.freedesktop.org/series/149614/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13203/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13203/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8382_FULL -&gt; XEIGTPW_13203_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8382 -&gt; IGTPW_13203</li>
<li>Linux: xe-3154-a1af1c0af1b870eab1359766073e7086833c8323 -&gt; xe-3156-2f74377e0846598397723197386e6d9d65b7711e</li>
</ul>
<p>IGTPW_13203: 13203<br />
  IGT_8382: 8382<br />
  xe-3154-a1af1c0af1b870eab1359766073e7086833c8323: a1af1c0af1b870eab1359766073e7086833c8323<br />
  xe-3156-2f74377e0846598397723197386e6d9d65b7711e: 2f74377e0846598397723197386e6d9d65b7711e</p>

</body>
</html>

--===============3651927930430821829==--
