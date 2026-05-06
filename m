Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261B6CD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 09:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2A710ED31;
	Wed,  6 May 2026 09:57:38 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5010EB11;
 Wed,  6 May 2026 09:57:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1894284624982879283=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/fbdev=3A_skip_non-zer?=
 =?utf-8?q?o_pans_on_mixed-size_multi-display_topologies?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 May 2026 09:57:22 -0000
Message-ID: <177806144298.42219.2360934602043486787@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506082242.2605199-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260506082242.2605199-1-chaitanya.kumar.borah@intel.com>
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

--===============1894284624982879283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/fbdev: skip non-zero pans on mixed-size multi-display topologies
URL   : https://patchwork.freedesktop.org/series/166039/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8890_BAT -> XEIGTPW_15108_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8890 -> IGTPW_15108

  IGTPW_15108: dd81407a98f4099ca5fc95055854a986a7fd5eb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8890: 76fa395927476927cf3ecd6cc5c188d470c0b5b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4990-835de80ce9b34b618442ba91483170201b50b553: 835de80ce9b34b618442ba91483170201b50b553

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15108/index.html

--===============1894284624982879283==
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
<tr><td><b>Series:</b></td><td>tests/fbdev: skip non-zero pans on mixed-size multi-display topologies</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166039/">https://patchwork.freedesktop.org/series/166039/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15108/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15108/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8890_BAT -&gt; XEIGTPW_15108_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8890 -&gt; IGTPW_15108</li>
</ul>
<p>IGTPW_15108: dd81407a98f4099ca5fc95055854a986a7fd5eb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8890: 76fa395927476927cf3ecd6cc5c188d470c0b5b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4990-835de80ce9b34b618442ba91483170201b50b553: 835de80ce9b34b618442ba91483170201b50b553</p>

</body>
</html>

--===============1894284624982879283==--
