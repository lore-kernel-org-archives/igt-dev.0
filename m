Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1156DC4345F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 09:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A272410F3A6;
	Thu,  2 May 2024 09:32:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2DC10F25F;
 Thu,  2 May 2024 09:32:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0384411134782484996=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/meson=2Ebuild=3A_Generat?=
 =?utf-8?q?e_test-list_for_cross_build?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 May 2024 09:32:50 -0000
Message-ID: <171464237097.1848758.2476185198450685685@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502064309.56280-1-vignesh.raman@collabora.com>
In-Reply-To: <20240502064309.56280-1-vignesh.raman@collabora.com>
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

--===============0384411134782484996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/meson.build: Generate test-list for cross build
URL   : https://patchwork.freedesktop.org/series/133130/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7828_BAT -> XEIGTPW_11092_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11092_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11092_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11092_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7828 -> IGTPW_11092
  * Linux: xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 -> xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025

  IGTPW_11092: 11092
  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009: 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009
  xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025: 8f904f61a50ed9e9869bead4a4dd767fce79a025

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/index.html

--===============0384411134782484996==
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
<tr><td><b>Series:</b></td><td>tests/meson.build: Generate test-list for cross build</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133130/">https://patchwork.freedesktop.org/series/133130/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7828_BAT -&gt; XEIGTPW_11092_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11092_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11092_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11092_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7828 -&gt; IGTPW_11092</li>
<li>Linux: xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 -&gt; xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025</li>
</ul>
<p>IGTPW_11092: 11092<br />
  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009: 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009<br />
  xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025: 8f904f61a50ed9e9869bead4a4dd767fce79a025</p>

</body>
</html>

--===============0384411134782484996==--
