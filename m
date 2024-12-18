Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A96E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 16:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583F110E1FA;
	Wed, 18 Dec 2024 16:51:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C8410E1FA;
 Wed, 18 Dec 2024 16:51:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1236289083670895401=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=3A_Add_xe=5Fcgroup?=
 =?utf-8?q?_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 16:51:35 -0000
Message-ID: <173454069547.96409.5042847064032265652@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217141601.369613-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241217141601.369613-1-maarten.lankhorst@linux.intel.com>
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

--===============1236289083670895401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add xe_cgroup test
URL   : https://patchwork.freedesktop.org/series/142725/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8163_BAT -> XEIGTPW_12336_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8163 -> IGTPW_12336

  IGTPW_12336: faa5b0e692d8a5ce48e95a259d48c05f6239921c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8163: 535c26685134adffa6d391432cb10391d6971501 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2395-78526dfb8799485890dae3877fea308e9501879c: 78526dfb8799485890dae3877fea308e9501879c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12336/index.html

--===============1236289083670895401==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add xe_cgroup test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142725/">https://patchwork.freedesktop.org/series/142725/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12336/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12336/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8163_BAT -&gt; XEIGTPW_12336_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8163 -&gt; IGTPW_12336</li>
</ul>
<p>IGTPW_12336: faa5b0e692d8a5ce48e95a259d48c05f6239921c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8163: 535c26685134adffa6d391432cb10391d6971501 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2395-78526dfb8799485890dae3877fea308e9501879c: 78526dfb8799485890dae3877fea308e9501879c</p>

</body>
</html>

--===============1236289083670895401==--
