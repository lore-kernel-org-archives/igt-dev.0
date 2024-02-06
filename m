Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEE5C48297
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 16:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306F112CC3;
	Tue,  6 Feb 2024 16:12:28 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3043D112CBF;
 Tue,  6 Feb 2024 16:12:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1335961318546362917=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu/amd=5Fbypass=3A_F?=
 =?utf-8?q?ix_psr_edp_rx_crc_read_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Feb 2024 16:12:28 -0000
Message-ID: <170723594819.1055668.9565034623154263276@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202151026.52210-1-hersenxs.wu@amd.com>
In-Reply-To: <20240202151026.52210-1-hersenxs.wu@amd.com>
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

--===============1335961318546362917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_bypass: Fix psr edp rx crc read timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/129472/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7704_BAT -> XEIGTPW_10637_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7704 -> IGTPW_10637
  * Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -> xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9

  IGTPW_10637: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10637/index.html
  IGT_7704: 7704
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f
  xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9: 8a42fafc783505db4f1d6a70005a5f103069c9d9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10637/index.html

--===============1335961318546362917==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_bypass: Fix psr edp rx crc read timeout (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129472/">https://patchwork.freedesktop.org/series/129472/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10637/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10637/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7704_BAT -&gt; XEIGTPW_10637_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7704 -&gt; IGTPW_10637</li>
<li>Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -&gt; xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9</li>
</ul>
<p>IGTPW_10637: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10637/index.html<br />
  IGT_7704: 7704<br />
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f<br />
  xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9: 8a42fafc783505db4f1d6a70005a5f103069c9d9</p>

</body>
</html>

--===============1335961318546362917==--
