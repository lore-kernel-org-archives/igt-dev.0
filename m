Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEB7CD6E64
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 08:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDBD113C56;
	Wed,  3 Jun 2026 08:58:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE01A113C56;
 Wed,  3 Jun 2026 08:58:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6607354764149597995=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/genxml=3A_Introduce_Mes?=
 =?utf-8?q?a_genxml_infrastructure_to_IGT_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jun 2026 08:58:25 -0000
Message-ID: <178047710577.38726.2767341812137446436@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602223756.2543404-1-jan.maslak@intel.com>
In-Reply-To: <20260602223756.2543404-1-jan.maslak@intel.com>
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

--===============6607354764149597995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/genxml: Introduce Mesa genxml infrastructure to IGT (rev5)
URL   : https://patchwork.freedesktop.org/series/164446/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8947_BAT -> XEIGTPW_15294_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8947 -> IGTPW_15294
  * Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -> xe-5190-b391419dc37a62b41f8e1a2489a8ae868109abee

  IGTPW_15294: 4c3b094ed26692ab11eaf2e229b9529820d19efe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc
  xe-5190-b391419dc37a62b41f8e1a2489a8ae868109abee: b391419dc37a62b41f8e1a2489a8ae868109abee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15294/index.html

--===============6607354764149597995==
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
<tr><td><b>Series:</b></td><td>lib/genxml: Introduce Mesa genxml infrastructure to IGT (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164446/">https://patchwork.freedesktop.org/series/164446/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15294/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15294/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8947_BAT -&gt; XEIGTPW_15294_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8947 -&gt; IGTPW_15294</li>
<li>Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -&gt; xe-5190-b391419dc37a62b41f8e1a2489a8ae868109abee</li>
</ul>
<p>IGTPW_15294: 4c3b094ed26692ab11eaf2e229b9529820d19efe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc<br />
  xe-5190-b391419dc37a62b41f8e1a2489a8ae868109abee: b391419dc37a62b41f8e1a2489a8ae868109abee</p>

</body>
</html>

--===============6607354764149597995==--
