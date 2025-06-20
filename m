Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F08DC7115B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Jun 2025 05:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269D910EADE;
	Fri, 20 Jun 2025 05:45:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9236110EADE;
 Fri, 20 Jun 2025 05:45:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2380086680513503103=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/pciids=3A_Add_PCI_IDs_f?=
 =?utf-8?q?or_xe2=5Fhpg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jun 2025 05:45:54 -0000
Message-ID: <175039835459.97145.8454097733778725907@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620053818.3633618-1-kunal1.joshi@intel.com>
In-Reply-To: <20250620053818.3633618-1-kunal1.joshi@intel.com>
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

--===============2380086680513503103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/pciids: Add PCI IDs for xe2_hpg
URL   : https://patchwork.freedesktop.org/series/150539/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8418_BAT -> XEIGTPW_13327_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8418 -> IGTPW_13327
  * Linux: xe-3273-b5956fc71790f85e9c9113adf1d9c7332c995f13 -> xe-3279-5feb17e0d6306981b3e2a7994164334e23dc4197

  IGTPW_13327: 13327
  IGT_8418: 8418
  xe-3273-b5956fc71790f85e9c9113adf1d9c7332c995f13: b5956fc71790f85e9c9113adf1d9c7332c995f13
  xe-3279-5feb17e0d6306981b3e2a7994164334e23dc4197: 5feb17e0d6306981b3e2a7994164334e23dc4197

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13328/index.html

--===============2380086680513503103==
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
<tr><td><b>Series:</b></td><td>lib/pciids: Add PCI IDs for xe2_hpg</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150539/">https://patchwork.freedesktop.org/series/150539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13328/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13328/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8418_BAT -&gt; XEIGTPW_13327_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8418 -&gt; IGTPW_13327</li>
<li>Linux: xe-3273-b5956fc71790f85e9c9113adf1d9c7332c995f13 -&gt; xe-3279-5feb17e0d6306981b3e2a7994164334e23dc4197</li>
</ul>
<p>IGTPW_13327: 13327<br />
  IGT_8418: 8418<br />
  xe-3273-b5956fc71790f85e9c9113adf1d9c7332c995f13: b5956fc71790f85e9c9113adf1d9c7332c995f13<br />
  xe-3279-5feb17e0d6306981b3e2a7994164334e23dc4197: 5feb17e0d6306981b3e2a7994164334e23dc4197</p>

</body>
</html>

--===============2380086680513503103==--
