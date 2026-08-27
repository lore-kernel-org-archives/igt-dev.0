Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0FEC61DC2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 07:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7A10EEC1;
	Thu, 27 Aug 2026 07:30:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E4610EEC0;
 Thu, 27 Aug 2026 07:29:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6827022804502415050=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/amdgpu=3A_add_GFX1154_c?=
 =?utf-8?q?hips_for_IGT_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kanala Ramalingeswara Reddy" <kanala.ramalingeswarareddy@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Aug 2026 07:29:20 -0000
Message-ID: <178781576001.89945.9793163912745616798@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827064743.3002608-1-Kanala.RamalingeswaraReddy@amd.com>
In-Reply-To: <20260827064743.3002608-1-Kanala.RamalingeswaraReddy@amd.com>
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

--===============6827022804502415050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: add GFX1154 chips for IGT tests
URL   : https://patchwork.freedesktop.org/series/172836/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9076_BAT -> XEIGTPW_15744_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15744_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15744_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 5)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_15744_BAT prevented too many machines from booting.

  Missing    (8): bat-lnl-2 bat-lnl-1 bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-bmg-2 bat-nvls-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9076 -> IGTPW_15744
  * Linux: xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 -> xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6

  IGTPW_15744: 15744
  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6: 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6
  xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6: acd8191c76e28f9b260f6701573fd1d2c76dd0f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15744/index.html

--===============6827022804502415050==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: add GFX1154 chips for IGT tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172836/">https://patchwork.freedesktop.org/series/172836/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15744/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15744/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9076_BAT -&gt; XEIGTPW_15744_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15744_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15744_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 5)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_15744_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-lnl-2 bat-lnl-1 bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-bmg-2 bat-nvls-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9076 -&gt; IGTPW_15744</li>
<li>Linux: xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 -&gt; xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6</li>
</ul>
<p>IGTPW_15744: 15744<br />
  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6: 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6<br />
  xe-5651-acd8191c76e28f9b260f6701573fd1d2c76dd0f6: acd8191c76e28f9b260f6701573fd1d2c76dd0f6</p>

</body>
</html>

--===============6827022804502415050==--
