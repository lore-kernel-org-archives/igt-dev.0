Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915E2CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 12:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3F910E36E;
	Tue, 26 May 2026 12:44:28 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A3C10E36E;
 Tue, 26 May 2026 12:44:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8982904426073942717=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Frotation=5Fcrc?=
 =?utf-8?q?=3A_Remove_verbose_debug_logging_from_rotation_paths?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 May 2026 12:44:07 -0000
Message-ID: <177979944792.9517.6567239048148501183@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526082751.1852524-1-jeevan.b@intel.com>
In-Reply-To: <20260526082751.1852524-1-jeevan.b@intel.com>
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

--===============8982904426073942717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: Remove verbose debug logging from rotation paths
URL   : https://patchwork.freedesktop.org/series/167263/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8937_BAT -> XEIGTPW_15244_BAT
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

  * IGT: IGT_8937 -> IGTPW_15244
  * Linux: xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b -> xe-5130-5fb5a9a63cf5ece68e0eeb6fa397da27712bccf0

  IGTPW_15244: 15244
  IGT_8937: 8937
  xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b: 04d475020800d0a1033ca89a0d6d5fc638ddc65b
  xe-5130-5fb5a9a63cf5ece68e0eeb6fa397da27712bccf0: 5fb5a9a63cf5ece68e0eeb6fa397da27712bccf0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15244/index.html

--===============8982904426073942717==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: Remove verbose debug logging from rotation paths</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167263/">https://patchwork.freedesktop.org/series/167263/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15244/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15244/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8937_BAT -&gt; XEIGTPW_15244_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8937 -&gt; IGTPW_15244</li>
<li>Linux: xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b -&gt; xe-5130-5fb5a9a63cf5ece68e0eeb6fa397da27712bccf0</li>
</ul>
<p>IGTPW_15244: 15244<br />
  IGT_8937: 8937<br />
  xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b: 04d475020800d0a1033ca89a0d6d5fc638ddc65b<br />
  xe-5130-5fb5a9a63cf5ece68e0eeb6fa397da27712bccf0: 5fb5a9a63cf5ece68e0eeb6fa397da27712bccf0</p>

</body>
</html>

--===============8982904426073942717==--
