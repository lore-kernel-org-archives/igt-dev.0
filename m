Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79602E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 21:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8AC10E97E;
	Tue, 10 Dec 2024 21:20:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25D210E97E;
 Tue, 10 Dec 2024 21:20:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6920617643388982839=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Only_check_joiner_mode_on_intel_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: george.zhang@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Dec 2024 21:20:15 -0000
Message-ID: <173386561598.968252.1673295541075087199@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210201207.917722-1-george.zhang@amd.com>
In-Reply-To: <20241210201207.917722-1-george.zhang@amd.com>
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

--===============6920617643388982839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Only check joiner mode on intel device
URL   : https://patchwork.freedesktop.org/series/142374/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8147_BAT -> XEIGTPW_12287_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8147 -> IGTPW_12287
  * Linux: xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f -> xe-2347-6fc9ce9b9be4070a485c20b372b34a7fe6a3897e

  IGTPW_12287: a45d32649fd4e6b67eb294159c10b8cd3ad72333 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f: afdbad14a16d9f44489fe37a05e93b24581bdc4f
  xe-2347-6fc9ce9b9be4070a485c20b372b34a7fe6a3897e: 6fc9ce9b9be4070a485c20b372b34a7fe6a3897e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12287/index.html

--===============6920617643388982839==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Only check joiner mode on intel device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142374/">https://patchwork.freedesktop.org/series/142374/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12287/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12287/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8147_BAT -&gt; XEIGTPW_12287_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8147 -&gt; IGTPW_12287</li>
<li>Linux: xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f -&gt; xe-2347-6fc9ce9b9be4070a485c20b372b34a7fe6a3897e</li>
</ul>
<p>IGTPW_12287: a45d32649fd4e6b67eb294159c10b8cd3ad72333 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f: afdbad14a16d9f44489fe37a05e93b24581bdc4f<br />
  xe-2347-6fc9ce9b9be4070a485c20b372b34a7fe6a3897e: 6fc9ce9b9be4070a485c20b372b34a7fe6a3897e</p>

</body>
</html>

--===============6920617643388982839==--
