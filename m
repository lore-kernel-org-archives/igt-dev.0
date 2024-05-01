Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2883C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 08:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F6112282;
	Wed,  1 May 2024 08:19:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C76112282;
 Wed,  1 May 2024 08:19:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6369097113360388654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/i915/perf=3A_Fix_warning_o?=
 =?utf-8?q?n_codegen?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 May 2024 08:19:30 -0000
Message-ID: <171455157091.1793171.1868362241963231011@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240501070145.49810-1-lucas.demarchi@intel.com>
In-Reply-To: <20240501070145.49810-1-lucas.demarchi@intel.com>
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

--===============6369097113360388654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/perf: Fix warning on codegen
URL   : https://patchwork.freedesktop.org/series/133113/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7828_BAT -> XEIGTPW_11089_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11089_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11089_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11089_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7828 -> IGTPW_11089

  IGTPW_11089: 11089
  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009: 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11089/index.html

--===============6369097113360388654==
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
<tr><td><b>Series:</b></td><td>lib/i915/perf: Fix warning on codegen</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133113/">https://patchwork.freedesktop.org/series/133113/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11089/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11089/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7828_BAT -&gt; XEIGTPW_11089_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11089_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11089_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11089_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7828 -&gt; IGTPW_11089</li>
</ul>
<p>IGTPW_11089: 11089<br />
  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009: 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009</p>

</body>
</html>

--===============6369097113360388654==--
