Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A1E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 17:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944210E21C;
	Wed, 18 Dec 2024 17:24:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A2F10E205;
 Wed, 18 Dec 2024 17:24:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6833162804176382993=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fexec=5Fba?=
 =?utf-8?q?lancer=3A_Decrease_expected_load_value_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 17:24:50 -0000
Message-ID: <173454269012.124020.14052031029885730850@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
In-Reply-To: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
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

--===============6833162804176382993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_balancer: Decrease expected load value (rev4)
URL   : https://patchwork.freedesktop.org/series/142150/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8163_BAT -> XEIGTPW_12337_BAT
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

  * IGT: IGT_8163 -> IGTPW_12337

  IGTPW_12337: d8a267363d03ccd461a81b0685093a87278e44ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8163: 535c26685134adffa6d391432cb10391d6971501 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2395-78526dfb8799485890dae3877fea308e9501879c: 78526dfb8799485890dae3877fea308e9501879c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12337/index.html

--===============6833162804176382993==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_balancer: Decrease expected load value (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142150/">https://patchwork.freedesktop.org/series/142150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12337/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12337/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8163_BAT -&gt; XEIGTPW_12337_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8163 -&gt; IGTPW_12337</li>
</ul>
<p>IGTPW_12337: d8a267363d03ccd461a81b0685093a87278e44ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8163: 535c26685134adffa6d391432cb10391d6971501 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2395-78526dfb8799485890dae3877fea308e9501879c: 78526dfb8799485890dae3877fea308e9501879c</p>

</body>
</html>

--===============6833162804176382993==--
