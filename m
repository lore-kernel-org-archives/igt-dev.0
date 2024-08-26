Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B846C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 05:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E6510E0D7;
	Mon, 26 Aug 2024 05:32:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DDC10E0D7;
 Mon, 26 Aug 2024 05:32:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3639802658389125653=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fplane=5Fscaling=3A?=
 =?utf-8?q?_Update_scaling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Aug 2024 05:32:27 -0000
Message-ID: <172465034760.783181.18177166233621584496@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
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

--===============3639802658389125653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Update scaling
URL   : https://patchwork.freedesktop.org/series/137769/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7990_BAT -> XEIGTPW_11634_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11634_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11634_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11634_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7990 -> IGTPW_11634
  * Linux: xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8 -> xe-1824-f83dc30335e989657706c73484b78dd755f909b4

  IGTPW_11634: 2d64d7a0063417b596e3e3d2d52ecffd875f7413 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8: 411a047925bb7e169a075a2ddfb63ba96f26a8c8
  xe-1824-f83dc30335e989657706c73484b78dd755f909b4: f83dc30335e989657706c73484b78dd755f909b4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11634/index.html

--===============3639802658389125653==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Update scaling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137769/">https://patchwork.freedesktop.org/series/137769/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11634/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11634/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7990_BAT -&gt; XEIGTPW_11634_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11634_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11634_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11634_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7990 -&gt; IGTPW_11634</li>
<li>Linux: xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8 -&gt; xe-1824-f83dc30335e989657706c73484b78dd755f909b4</li>
</ul>
<p>IGTPW_11634: 2d64d7a0063417b596e3e3d2d52ecffd875f7413 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8: 411a047925bb7e169a075a2ddfb63ba96f26a8c8<br />
  xe-1824-f83dc30335e989657706c73484b78dd755f909b4: f83dc30335e989657706c73484b78dd755f909b4</p>

</body>
</html>

--===============3639802658389125653==--
