Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C638C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 05:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF51A10E68C;
	Wed,  5 Jun 2024 05:19:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FAE10E68C;
 Wed,  5 Jun 2024 05:19:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4128394675264024929=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tools/lsgpu=3A_Add_switch_to_d?=
 =?utf-8?q?isplay_gpu_pci_devices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Jun 2024 05:19:12 -0000
Message-ID: <171756475222.2266479.2867159899422480541@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240605045308.97175-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240605045308.97175-1-zbigniew.kempczynski@intel.com>
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

--===============4128394675264024929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/lsgpu: Add switch to display gpu pci devices (rev2)
URL   : https://patchwork.freedesktop.org/series/134438/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7877_BAT -> XEIGTPW_11220_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7877 -> IGTPW_11220
  * Linux: xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62 -> xe-1399-596cf447db94909c4788fd612876520531e439b0

  IGTPW_11220: 11220
  IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62: 692c2b76453385a04b1eef40f3cdbc0097074f62
  xe-1399-596cf447db94909c4788fd612876520531e439b0: 596cf447db94909c4788fd612876520531e439b0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/index.html

--===============4128394675264024929==
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
<tr><td><b>Series:</b></td><td>tools/lsgpu: Add switch to display gpu pci devices (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134438/">https://patchwork.freedesktop.org/series/134438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7877_BAT -&gt; XEIGTPW_11220_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7877 -&gt; IGTPW_11220</li>
<li>Linux: xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62 -&gt; xe-1399-596cf447db94909c4788fd612876520531e439b0</li>
</ul>
<p>IGTPW_11220: 11220<br />
  IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62: 692c2b76453385a04b1eef40f3cdbc0097074f62<br />
  xe-1399-596cf447db94909c4788fd612876520531e439b0: 596cf447db94909c4788fd612876520531e439b0</p>

</body>
</html>

--===============4128394675264024929==--
