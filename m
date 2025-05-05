Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E882CC369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 06:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A4010E2EB;
	Mon,  5 May 2025 06:01:44 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191EF10E27D;
 Mon,  5 May 2025 06:01:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6486660349813567585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Ftiled=5Fdisplay?=
 =?utf-8?q?=3A_Skip_if_connectors_are_not_of_same_type_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 May 2025 06:01:43 -0000
Message-ID: <174642490309.43928.2225929322273591687@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505034941.930385-1-pranay.samala@intel.com>
In-Reply-To: <20250505034941.930385-1-pranay.samala@intel.com>
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

--===============6486660349813567585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_tiled_display: Skip if connectors are not of same type (rev2)
URL   : https://patchwork.freedesktop.org/series/148468/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8353_BAT -> XEIGTPW_13075_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13075_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13075_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_13075_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8353 -> IGTPW_13075
  * Linux: xe-3030-66dbd091942ffec06a91480c22916f389670a87c -> xe-3032-9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115

  IGTPW_13075: cf6b1715cb114995981939ed8e00f4573f71b932 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8353: 8353
  xe-3030-66dbd091942ffec06a91480c22916f389670a87c: 66dbd091942ffec06a91480c22916f389670a87c
  xe-3032-9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115: 9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13076/index.html

--===============6486660349813567585==
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
<tr><td><b>Series:</b></td><td>tests/kms_tiled_display: Skip if connectors are not of same type (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148468/">https://patchwork.freedesktop.org/series/148468/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13076/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13076/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8353_BAT -&gt; XEIGTPW_13075_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13075_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13075_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_13075_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8353 -&gt; IGTPW_13075</li>
<li>Linux: xe-3030-66dbd091942ffec06a91480c22916f389670a87c -&gt; xe-3032-9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115</li>
</ul>
<p>IGTPW_13075: cf6b1715cb114995981939ed8e00f4573f71b932 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8353: 8353<br />
  xe-3030-66dbd091942ffec06a91480c22916f389670a87c: 66dbd091942ffec06a91480c22916f389670a87c<br />
  xe-3032-9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115: 9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115</p>

</body>
</html>

--===============6486660349813567585==--
